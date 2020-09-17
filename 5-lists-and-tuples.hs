
-- LISTS & TUPLES
---------------------------------------------------------

-- Lists can only have one type, e.g.
[1, 2, 3, 4, 5] :: [Integer]

-- Constructors

-- Empty List:
[]
[1, 2, 3, 4, 5]
-- Colon/prepend/cons
-- prepends any existing element x to an existing list xs
x:xs
1 : 2 : 3 : 4 : 5 : []

-- Ranges
-- generate list the easy way
[1..5]
['a'..'z']

-- You can also specify the step with ranges. Only one step can be given
[2, 0..100] -- lists the even numbers from 0 to 100

-- some ambiguity when moving backwards
[20..1] -- is not a list from 20 -> 1
[20,19..1] -- this is

-- floating points' imprecision can lead to weird range behavior
-- learn a good haskell lady says not to use them in ranges
[0.1, 0.3 .. 1]
=>[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]  

-- Since Haskell is lazy, we can make infinite lists that it won't try to evaluate
-- This says to take 24 elements of this infinite list of 13's multiples
take 24 [13,26..]



-- Generating a List
-- asc - ascending list from n to m
asc :: Int -> Int -> [Int]
asc n m
	| m < n = []
	| m == n = [m]
	| m > n = n : asc (n+1) m

-- library which contains lots of list functionality
import Data.List

-- get the head element of a list
head :: [a] -> a
head [1, 2, 3, 4, 5]
	=> 1

-- get the tail of a list
tail :: [a] -> [a]
tail [1, 2, 3, 4, 5]
	=> [2, 3, 4, 5]

-- get the length of a list
length :: [a] -> Int
length [1, 2, 3, 4, 5]
	=> 5

-- gives A COPY of list w/ last element removed
init :: [a] -> [a]
init  [1, 2, 3, 4, 5]
	=> [1, 2, 3, 4]

-- determine if a list is empty
-- important to check if list is empty b4 calling other functions on it
null :: [a] -> Bool
null []
	=> True
null [1, 2, 3, 4, 5]
	=> False


-- Functions for Lists of Booleans

and :: [Bool] -> Bool
and [True, False, True]
	=> False

or :: [Bool] -> Bool
or [True, False, True]
	=> True

-- List Comprehensions
-- take a list and build a new list out of it

-- take a list and return a list of those elements multiplied by two
[ 2*x | x <- [1, 2, 3] ] => [2, 4, 6]

-- same as above, except use a guard to filter which elements are used
[ 2*x | x <- [1, 2, 3], x > 1 ] => [4, 6]

-- example with multiple lists being turned into tuples
[ (x, y) | x <- [1, 2, 3], y <- ['a', 'b'] ]
	=> [ (1, 'a'), (1, 'b'), (2, 'a'), (2, 'b'), (3, 'a'), (3, 'b') ]

-- generally stated, important that this can be done on multiple lists and with multiple guards
[<gen> | <elem> <- <list>, ..., <guard>, ...]

-- List Patterns
-- lists also can use pattern matching

-- sum of empty list is zero, sum of list goes through and recursively adds up list
sum :: [Int] -> Int
sum []	= 0
sum (x:xs) = x + sum xs

-- similar to above, but only even numbers are prepended to the new list being generated
evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
	| mod x 2 == 0 = x : evens xs
	| otherwise = evens xs

-- Tuples
-- Have multiple elements in a pair, can have two or more elements

-- pattern matching to find first and second vals of a tuple
fst :: (a, b) -> a
fst (x, _) = x

snd :: (a, b) -> b
snd (_, y) = y

let (x, y) = (1, 2) in x
	=> 1

-- exaple of a function adding tuples in a list and generating a new list
addTuples :: [(Int, Int)] -> [Int]
addTuples xs = [x+y | (x,y) <- xs]

addTuples [ (1,2), (2,3), (100,100) ]
	=> [3, 5, 200]
