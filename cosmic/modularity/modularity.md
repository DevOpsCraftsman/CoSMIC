# Modularity

## Basic Example

Let’s say we want to perform a complex computation with 2 values and display the result.
We could implement it like this:

```python
def main(a: float, b: float) -> None:
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")


def compute(a: float, b: float) -> float:
    print("processing…")
    return 123.45
```

The problem is that now, our function `main` is bind to us `compute`, and nothing else.
If we were able the implement the same computation with another algorithm that is
more efficient or produce more accurate result, we would have to change the code by
hand, because at runtime there is no parametrization possible.

This can be easily improved this way:

```python
from typing import Callable
type FloatBiFunc = Callable[[float, float], float]  # python3.12 type alias


def default_compute(a: float, b: float) -> float:
    print("processing…")
    return 123.45


def main(a: float, b: float, compute: FloatBiFunc = default_compute) -> None:
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")
```

Now, the client code of this module can use a custom `compute` function if he wants to.
