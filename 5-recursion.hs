-- RECURSION
--------------------------------------------

-- Haskell uses recursion rather than loops

-- faculty example
fac n =
	if n <= 1 then
		1
	else
		n * fac (n-1)
-- Guards - a different way to write a funtion with conditional behavior
-- can have arbitrary amount based on desired behavior
fac n
	| n <= 1 = 1
	| otherwise = n * fac (n-1)

-- Pattern Matching
-- "_" functions as a wildcard here. there are two definitions of the function based on different patterns
-- this would be a duplicate definition in other languages, but haskell is not other languages.
-- Important to know it's evaluated from top to bottom, so if the wildcard was on top, it would never detect 0, bc it would match to the wildcard
is_zero 0 = True
is_zero _ = False

-- Accumulators
-- alternate method of recursion. "Tail-recursive"
fac n = aux n 1
	where
		aux n acc
			| n <= 1 = acc
			|otherwise = aux (n - 1) (n * acc)
