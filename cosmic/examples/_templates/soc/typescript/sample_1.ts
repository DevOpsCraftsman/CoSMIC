import { readFileSync } from 'node:fs'

function main() {
    const content = readFileSync("numbers.txt")
    const numbers = content.map(parseInt)
    const result = numbers.reduce((next: number, sum: number) => sum + next, 0)
    console.log(`The result of the operation is: ${result}`)
}
