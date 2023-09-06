class TransformableList(list):
    def apply(self, func):
        for i, n in enumerate(self):
            self[i] = func(n)

list_1 = TransformableList([3, 23, -5])
list_1.apply(lambda n: n * 2)

list_2 = TransformableList([4, 2, 1, 100, 33])
list_2.apply(lambda n: n / 2 if n % 2 == 0 else n * 3 + 1)
