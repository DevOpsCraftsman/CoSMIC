def main():
    with open("numbers.txt") as file:
        lines = file.readlines()
        numbers = [int(line) for line in file]
        result = sum(numbers) * 3
        print(f"The result of the operation is: {result}")
