# Modularity

## Basic Example

Let’s we want to perform a complex computation with 2 values and display the result.
We could implement it like this:
```python
def main(a: int, b: float) -> None:
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")

def compute(a: int, b: float) -> float:
    print("processing…")
    return 123.45
```

The problem is that now, our function `main` is bind to us `compute`, and nothing else.
If we would be able the implement the same computation with another aglorithm that is
more efficient or produce more accurate result, we would have to change the code by
hand, because at runtime there is no parametrization possible.

This can be easily improved this way:
```python
def main(a: int, b: float, compute=default_compute) -> None:
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")

def default_compute(a: int, b: float) -> float:
    print("processing…")
    return 123.45
```
Now, the client code of this module can use a custom `compute` function if he wants to.