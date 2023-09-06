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
