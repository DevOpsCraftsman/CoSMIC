class TransformableList<T> extends Array<T> {
    apply(self, func: (T) => T) {
        for (const [i, n] of Object.entries(list_1)) {
            self[i] = func(n)
        }
    }
}

let list_1 = new TransformableList([3, 23, -5])
list_1.apply((n: number) => n * 2)

let list_2 = new TransformableList([4, 2, 1, 100, 33])
list_2.apply((n: number) => (n % 2 == 0) ? n / 2 : n * 3 + 1)
