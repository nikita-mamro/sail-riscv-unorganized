from random import randint
import sys

ELEMENTS_NUMBER = 100_000

DEFINE_DATASIZE = '#define DATA_SIZE {data_size}'

OPEN_DATA = '{'
INPUT_DATA = '{data_type} input_data[DATA_SIZE] ='
END_DATA = '};'

def main():
    expected_sum = 0
    upper = sys.maxsize
    lower = -sys.maxsize - 1
    numbers_line = ''

    for _ in range(ELEMENTS_NUMBER):
        number = randint(lower, upper)
        numbers_line += f'{number}, '

    flines = [
        DEFINE_DATASIZE.format(data_size = ELEMENTS_NUMBER),
        INPUT_DATA.format(data_type = 'long int'),
        OPEN_DATA,
        numbers_line[:-2],
        END_DATA
        ]

    with open('dataset.h', 'w') as file:
        file.writelines(line + '\n' for line in flines)

if __name__ == '__main__':
    main()