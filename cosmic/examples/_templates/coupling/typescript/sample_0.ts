function main1(a: number, b: number): void {
    const result = compute(a, b)
    console.log(`The result of the computation of ${a} and ${b} is: ${result}`)
}


function compute(a: number, b: number): number {
    console.log("processing…")
    return 123.45
}
