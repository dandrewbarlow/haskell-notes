-- FUNCTIONS
------------------------------------------

-- Haskell is a functional language. This means that doing anything requires passing a value to a function and recieving a result. Functions don't have side effects, don't alter anything, and values can't even be changed. This means that functions always get the same result when passed the same input. Like many things in life, this constriction is both the most difficult aspect of the language and its greatest benefit. It allows for efficiency, an unusual elegance, and the removal of some problem areas of coding (like forgetting the effects of a rogue function). Some parts of it are a lil rough to learn, but functions in particular get the star treatment.

-- Haskell, being written by very smart people who are also bastards, has no parentheses for functions
-- for example,
succ 8
-- calls the function succ with 8 as a parameter (succ stands for successor), returning 9
succ 9 * 2
-- calls succ of 9 and then multiplies this by 2, giving 20
succ (9 * 2)
-- This calls succ 18, giving 19
succ (succ 8)
-- does not call succ with two arguments, but calls succ 8 and then feeds that into succ again

-- This does not change when it has two arguments, as shown in the following example

-- If add is defined as:
add a b = a + b
-- These two statements are equivalent.
-- The first is a prefix function, eg f x y
-- The second is an infix function, eg x f y
add 10 20
10 `add` 20

{- 
 - Take special note as well that operations defined by special characters
 - +,-,*,/,==,/=
 - are all functions as well. They are infix by default
 - To examine its type, pass it to another function, or call it as a prefix function,
 - you must surround it with parentheses 
 -}
:t (==)
 => (==) :: (Eq a) => a -> a -> Bool  


-- the following functions all do the same thing in different ways
in_range min max x =
	x >= min && x <= max

in_range min max x =
    let in_lower_bound = min <= x
    let in_upper_bound = max >= x
	in
		in_lower_bound && in_upper_bound

in_range min max x = ilb && iub
	where
		ilb = min <= x
		iub = max >= x

in_range min max x =
	if ilb then iub else False
	where
		ilb = min <= x
		iub = max >= x

