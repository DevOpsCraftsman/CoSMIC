# Coupling

## Basic Example

Let’s say we want to perform a complex computation with 2 values and display the result.
We could implement it like this:

```python
def main(a, b):
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")


def compute(a, b):
    print("processing…")
    return 123.45
```

The problem is that now, our function `main` is bind to us `compute`, and nothing else.
If we were able the implement the same computation with another algorithm that is
more efficient or produce more accurate result, we can’t use it…

This can be easily improved this way:

```python
def default_compute(a, b):
    print("processing…")
    return 123.45


def main(a, b, compute=default_compute):
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")
```

Now, it is possible to pass a different `compute` function if we want to.
