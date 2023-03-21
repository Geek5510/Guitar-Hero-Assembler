from os.path import isfile
from math import ceil
from hashlib import sha256

CHUNK_SIZE = 65536


def get_chunk_info(file_path, chunk_index):
    """
    Gets the file offset and size of the chunk at the specified index
    :param chunk_index: the index of the chunk to get info for
    :param file_path: path of file to get chunk info from
    :return: a tuple of the file offset and size of the chunk
    """
    # Making sure file exists
    if isfile(file_path):

        # Opening file with 'read binary' mode
        with open(file_path, 'rb') as f:

            # Checking the file size
            f.seek(0, 2)
            total_size = f.tell()

            # If file is smaller than 4 chunk sizes, we divide it into four parts
            if CHUNK_SIZE > total_size / 4:
                # when not all chunks before last are equal in length
                asymmetric_read_count = total_size % 4
                read_buffer_size = ceil(total_size / 4)
            else:
                asymmetric_read_count = 0
                read_buffer_size = CHUNK_SIZE

            # Going back to the start of the file
            f.seek(0, 0)

            # Starting offset of the current chunk
            current_offset = 0

            # Loop through the file to find the desired chunk
            for i in range(chunk_index):
                # Reading the data according to the read buffer size
                data = f.read(read_buffer_size)

                # If finished reading
                if not data:
                    raise IndexError('Chunk index out of range')

                # If we need to change the read size
                if asymmetric_read_count > 0:
                    asymmetric_read_count -= 1
                    if asymmetric_read_count == 0:
                        read_buffer_size -= 1

                current_offset += read_buffer_size
                left_to_read = total_size - current_offset

                # If the buffer is bigger than what's left to read
                if read_buffer_size > left_to_read:
                    # Setting reading buffer to what's left
                    read_buffer_size = left_to_read

            # Get the size of the desired chunk
            chunk_size = read_buffer_size
            if asymmetric_read_count > 0:
                chunk_size -= 1

            # Return a tuple of the file offset and size of the chunk
            return current_offset, chunk_size


f_name = "Hasher.py"

c_info = get_chunk_info(f_name, 0)
print(c_info)

with open(f_name, "rb") as f:
    f.seek(c_info[0])
    data = f.read(c_info[1])

hash = sha256()
hash.update(data)
print(hash.hexdigest())
