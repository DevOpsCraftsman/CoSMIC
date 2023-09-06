def default_compute(a, b):
    print("processing…")
    return 123.45


def main(a, b, compute=default_compute):
    result = compute(a, b)
    print(f"The result of the computation of {a} and {b} is: {result}")
