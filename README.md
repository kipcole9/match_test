# Match Test

Run `run.sh` from a shell. It will run the same tests with the same Elixir 1.14 but the first run is on OTP 25 and no errors are detected. 
The second run is on OTP 26 and there are error results returned.

### The error

There appears to be a difference in how function heads are matched between the two OTP releases.  

In this example, several function clauses are defined from a list through a `for` comprehension. 
The clauses are generated in order of descending string length so that the clauses alway try
the longest match.

The match is against the string and a remainder like:
```elixir
def match(<<unquote(unit_string), rest::binary>>)
```

Then using the same list of strings, in the same order, we invoke the function that has as
many function heads as there are list members, in the same descending string length order.

In so doing we should expect all strings to match to the function head with the same string.
This is what happens in OTP 25. In OTP 26 some of the matches are to a subset of the string 
where that subset is prefix of the string being matched.

This only happens with clauses of the form `def match(<<unquote(unit_string), rest::binary>>)`.
Clauses of the form `def match(<<unquote(unit_string)>>)` match correctly.



