type ComputeFn = (a: number, b: number) => number 

function main2(a: number, b: number, compute: ComputeFn = defaultCompute): void {
    const result = compute(a, b)
    console.log(`The result of the computation of ${a} and ${b} is: ${result}`)
}

function defaultCompute(a: number, b: number): number {
    console.log("processing…")
    return 123.45
}
