# Abstraction

## Basic Example

Let’s say we want to manipulate lists. We want to be able to apply transformation to
theirs elements in place (without creating new lists). We could do it like this:

```typescript
let list_1 = [3, 23, -5]

for (const [i, n] of Object.entries(list_1)) {
    list_1[i] = n * 2
}


let list_2 = [4, 2, 1, 100, 33]

for (const [i, n] of Object.entries(list_2)) {
    if (n % 2 == 0) {
        list_2[i] = n / 2
    } else {
        list_2[i] = n * 3 + 1
    }
}
```

It’s painful to do it this way, because we have to manipulate the lists and theirs
indices by hand.  
There is a better way to handle this, by introducing a new kind of list which provide
this ability for us:

```typescript
class TransformableList<T> extends Array<T> {
    constructor(items: Iterable<T>) {
        super(...items);
    }

    apply(func: (n: T) => T): void {
        for (const [i, n] of Object.entries(this)) {
            self[i] = func(n)
        }
    }
}


let list_3 = new TransformableList([3, 23, -5])
list_3.apply((n: number) => n * 2)


let list_4 = new TransformableList([4, 2, 1, 100, 33])
list_4.apply((n: number) => (n % 2 == 0) ? n / 2 : n * 3 + 1)
```

This way, we can apply any function to our lists, without having to bother with low level 
details like indices.
