# Cohesion

## Basic Example

Let’s say we have a class Timer like this:

```typescript
class Timer1 {
    start() {
        console.log("starting timer")
    }

    stop() {
        console.log("stop timer")
    }
}
```

If we were told to add a suspend functionnality, it would be a bad
idea to implement it in a separate file like this:

```typescript
function suspend(timer: Timer1) {
    console.log("suspend timer")
}
```

There is a big probality that, if the 2 other functionnality of the
timer change, this third will need to be updated too.  
So, we better have to put them altogether:

```typescript
class Timer2 {
    start() {
        console.log("starting timer")
    }

    stop() {
        console.log("stop timer")
    }

    suspend() {
        console.log("suspend timer")
    }
}
```

Same thing without using a class; if `Timer` was just some sort of
simple data structure, we would have placed the 3 functions in a single file:

```typescript
function start(timer: Timer2) {
    console.log("starting timer")
}

function stop(timer: Timer2) {
    console.log("stop timer")
}

function suspend(timer: Timer2) {
    console.log("suspend timer")
}
```
