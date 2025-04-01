# Question 1
Write a program `occurs` that reads input from stdin and for each
unique line in the input outputs a line with a number indicating how
many times that line appeared in the input and the contents of those
lines.  For example, the following command:

```
occurs <<eof
a
a
b
c
b
eof
```

Should output this:

```
2 a
2 b
1 c
```

The order is not important.  So any permutation of these lines is
acceptable.

# Question 2
How does your solution perform for large inputs.  How does it handle
100M rows for instance?

```
time yes | head -n 100000000
```

Is it slow?  You can compare it to this program: `sort | uniq
--count`.  If your solution is slow, can it be improved.

# Question 3
Modify your program to group lines based on their "signature".  A
signature of string is all the non white space characters in that
line.


# Question 4
More time? https://projecteuler.net/problem=14
