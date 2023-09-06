# Separation of Concerns

## Basic example

Let‘s say we have a text file with a number at each line.  
We want to add them up, and multiply the result by 3, 
then print the result to the console.
Here is a straightforward way do to it:



There is lot of things going on here:
- reading a file and convert lines into numbers
- process the numbers
- print it within a nice sentence

We can break those operations into several functions, to separate responsabilities:



Now, if we want to change the way the computation is done (multipliy by 2 instead of 3),
We just need to go in the `process_numbers`, where this concern is adressed.  
If we want to read the numbers from another file, or from an HTTP request, it will be
in the `get_numbers` function that will handle that.  
And if we want to write the output in a file instead of printing in the terminal,
only the `display_result` will need adjustments.

**WARNING**: this may seem overkill for a simple little script. But in real-world
applications, the complexity tends to grow in an unforseen way very quickly, so it’s
a good idea to think about "Separation of Concerns" early on…