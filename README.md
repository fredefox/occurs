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
--count`.  If it's slow: Why? Can it be improved?

# Question 3
Modify your program to group lines based on their "signature".  A
signature of string is all the non white space characters in that
line.  The output should contain an arbitrary element from that
group.  In the example from before all lines would be added to the same
group:

```
5 a
```

It would also be allowed to output `5 b` or `5 c`.  Here's another example:

```
occurs <<eof
a.
 a
a
b.
eof
```

Should give as output:

```
1 a
1  a
2 a.
```

# Question 4
Modify your program to run with the previous behaviour, except if it
receives an argument `--signature` in which case it exhibits the
latter behaviour.
