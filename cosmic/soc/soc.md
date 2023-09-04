# Separation of Concerns

## Basic example

Let‘s say we have a text file with a number at each line.  
We want to add them up, and multiply the result by 3, 
then print the result to the console.
Here is a straightforward way do to it:

```python
with open("numbers.txt") as file:
    lines = file.readlines()
    numbers = [int(line) for line in file]
    result = sum(numbers) * 3
    print(f"The result of the operation is: {result}")
```

There is lot of things going on here:
- reading a file and convert lines into numbers
- process the numbers
- print it within a sentence

We can break those operations into several functions, to separate responsabilities:

```python
def get_numbers() -> list[int]:
    with open("numbers.txt") as file:
        return [int(line) for line in file]
        
def process_numbers(numbers: list[int]) -> int:
    return sum(numbers) * 3
    
def display_result(result: int) -> None:
    print(f"The result of the operation is: {result}")
    
numbers = get_numbers()
result = process_numbers(numbers)
display_result(result)
```

Now, if we want to change the way the computation is done (multipliy by 2 instead of 3),
We just need to go in the `process_numbers`, where this concern is adressed.
If we want to read the numbers from another file, or from an HTTP request, it will be
in the `get_numbers` function.
And if we want to write the output in a file instead of printing in the terminal,
only the `display_result` will need adjustments.

**WARNING**: this may seem overkill for a simple little script. But in real-world
application, the complexity tends to grow in an unforseen way very quickly, so it’s
a good idea to think about "Separation of Concerns" earsy on…
