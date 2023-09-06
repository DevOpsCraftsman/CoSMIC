def main():
    numbers = get_numbers()
    result = process_numbers(numbers)
    display_result(result)


def get_numbers():
    with open("numbers.txt") as file:
        return [int(line) for line in file]


def process_numbers(numbers):
    return sum(numbers) * 3


def display_result(result):
    print(f"The result of the operation is: {result}")
