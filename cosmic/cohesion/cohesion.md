# Basic Example
Let’s say we have a class Timer like this:

```python
class Timer:
    
    def start(self):
        print("starting timer")
        
    def stop(self):
        print("stop timer")
```

If we were told to add a suspend functionnality, it would be a bad
idea to implement it in a separate file like this:

```python
def suspend(timer: Timer):
    print("suspend timer")
```

There is a big probality that, if the 2 others functionnality of the
timer change, this third will need to be updated too.  
So, we better have to put them altogether:

```python
class Timer:
    
    def start(self):
        print("starting timer")
        
    def stop(self):
        print("stop timer")

    def suspend(timer: Timer):
        print("suspend timer")
```

Same thing without using a class; if `Timer` was just some sort of
simple datastructure, we would have place 3 functions in the same file:

```python
def start(timer: Timer):
    print("starting timer")
    
def stop(timer: Timer):
    print("stop timer")

def suspend(timer: Timer):
    print("suspend timer")
```