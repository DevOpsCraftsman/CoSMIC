# Coupling

## Basic Example

Let’s say we want to perform a complex computation with 2 values and display the result.
We could implement it like this:

```typescript
function main1(a: number, b: number): void {
    const result = compute(a, b)
    console.log(`The result of the computation of ${a} and ${b} is: ${result}`)
}


function compute(a: number, b: number): number {
    console.log("processing…")
    return 123.45
}
```

The problem is that now, our function `main` is bind to us `compute`, and nothing else.
If we were able the implement the same computation with another algorithm that is
more efficient or produce more accurate result, we can’t use it…

This can be easily improved this way:

```typescript
type ComputeFn = (a: number, b: number) => number 

function main2(a: number, b: number, compute: ComputeFn = defaultCompute): void {
    const result = compute(a, b)
    console.log(`The result of the computation of ${a} and ${b} is: ${result}`)
}

function defaultCompute(a: number, b: number): number {
    console.log("processing…")
    return 123.45
}
```

Now, it is possible to pass a different `compute` function if we want to.
