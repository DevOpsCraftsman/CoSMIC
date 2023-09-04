# Abstraction

## Basic Example

Let’s say we want to manipulate lists. We want to be able to apply transformation to
theirs elements in place (without creating new lists). We could do it like this:

```python
list_1 = [3, 23, -5]
for i, n in enumerate(list_1):
    list_1[i] = n * 2

list_2 = [4, 2, 1, 100, 33]
for i, n in enumerate(list_2):
    if n & 2 == 0:
        list_2[i] = n / 2
    else:
        list_2[i] = n * 3 + 1

```

It’s painful to do it this way, because we have to manipulate the lists and theirs
indices by hand.  
There is a better way to handle this, by introducing a new kind of list which provide
this ability for us:

```python
class TransformableList(list):
    def apply(self, func):
        for i, n in enumerate(self):
            self[i] = func(n)

list_1 = TransformableList([3, 23, -5])
list_1.apply(lambda n: n * 2)

list_2 = TransformableList([4, 2, 1, 100, 33])
list_2.apply(lambda n: n / 2 if n % 2 == 0 else n * 3 + 1)

```

This way, we can apply any function to our lists, without having to bother with low level 
details like indices.
