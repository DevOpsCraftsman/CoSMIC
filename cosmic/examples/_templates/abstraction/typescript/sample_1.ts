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
