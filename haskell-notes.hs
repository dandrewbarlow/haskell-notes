-- Andrew Barlow
-- Notes on haskell
-- Following the excellent tutorial by Philipp Hagenlocher
-- https://www.youtube.com/playlist?list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV
-- That series contains a lot of concepts and less hands on stuff, so I'm 
-- also using distrotube & learn you a good haskell to round it out


-- DATATYPES
----------------------------------------------------

-- Haskell is good at guessing which datatype you are declaring, but it's still important to specify, as a best-practice/optimization/bug deterrance

myVar :: Type

-- this can now be defined

myVar = value


-- Bool - True / False

-- Int - Whole number between -2^63 and 2^63

-- Integer - Unbounded whole number

-- Float - floating point
myFloat = 1.5
otherFloat = 20.22

-- Double - more floating point precision
myDouble = 0.0000000000001

-- Char - single character, denoted by single quotes
myChar ='h'

-- [Char] - a string is a list of chars
myName = "Andrew" 
myNameAlt = ['A', 'n', 'd', 'r', 'e', 'w']

-- Tuple - value pair / set
myTuple = (1, 2)


-- MATH

addNum= 3 + 6
subNum = 3 - 6
multNum = 3 * 6
divNum = 3 / 6

-- good ex of how function can be rewritten 
modNum = mod 9 2
modNum` = 9 `mod` 2

-- must wrap negatives in parentheses
addNeg = 4 + (-4)

myDouble = 1.222222
truncDouble = truncate myDouble 
roundDouble = round myDouble
ceilDouble = cieling myDouble 
floorDouble = floor myDouble 


-- this command requires a float / double
squareRoot = sqrt x



-- FUNCTIONS
------------------------------------------

-- If add is defined as:
add a b = a + b
-- These two statements are equivalent
add 10 20
10 `add` 20


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
is_zero 0 = True
is_zero _ = False

-- Accumulators
-- alternate method of recursion. "Tail-recursive"
fac n = aux n 1
	where 
		aux n acc
			| n <= 1 = acc
			|otherwise = aux (n - 1) (n * acc)



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


