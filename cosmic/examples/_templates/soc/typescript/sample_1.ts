import { readFileSync } from 'node:fs'

function main(): void {
    const numbers = getNumbers()
    const result = processNumbers(numbers)
    displayResult(result)
}

function getNumbers(): number[] {
    const content = readFileSync("numbers.txt")
    return content.map(parseInt)
}

function processNumbers(numbers: number[]): number {
    const result = numbers.reduce((next: number, sum: number) => sum + next, 0)
    return result * 3
}

function displayResult(result: number): void {
    console.log(`The result of the operation is: ${result}`)
}
