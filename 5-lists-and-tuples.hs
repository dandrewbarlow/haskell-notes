
-- LISTS & TUPLES
---------------------------------------------------------
-- Lists can only have one type, e.g.
[1, 2, 3, 4, 5] :: [Integer]


-- Constructors
------------------------------------------------------------------

-- Empty List:
[]
[1, 2, 3, 4, 5]
-- Colon/prepend/cons
-- prepends any existing element x to an existing list xs
x:xs
1 : 2 : 3 : 4 : 5 : []



-- Ranges
-------------------------------------------------------------------
-- generate a list the easy way
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

-- cycle turns a list into an infinite list
-- must cut off any access to avoid infinitely listing and infinite list
take 10 (cycle [1,2,3])
 =>[1,2,3,1,2,3,1,2,3,1]

-- repeat takes an element and produces an infinite list of just that element
-- same cut off advice applies here
take 10 repeat 5
[5,5,5,5,5,5,5,5,5,5]

-- to do this finitely, it is easier to use replicate
replicate 5 10
[5,5,5,5,5,5,5,5,5,5]



-- Generating a List
----------------------------------------------------------------------
-- asc - ascending list from n to m
asc :: Int -> Int -> [Int]
asc n m
	| m < n = []
	| m == n = [m]
	| m > n = n : asc (n+1) m

-- library which contains lots of list functionality
-- useful and neccessary for most work with lists
import Data.List

-- head
-- get the head element of a list
head :: [a] -> a
head [1, 2, 3, 4, 5]
	=> 1

-- tail
-- get the tail of a list
tail :: [a] -> [a]
tail [1, 2, 3, 4, 5]
	=> [2, 3, 4, 5]

-- length
-- get the length of a list
length :: [a] -> Int
length [1, 2, 3, 4, 5]
	=> 5

-- init
-- gives A COPY of list w/ last element removed
init :: [a] -> [a]
init  [1, 2, 3, 4, 5]
	=> [1, 2, 3, 4]

-- null
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
------------------------------------------------------------------------
-- take a list and build a new list out of it
-- Similar to set comprehensions

-- This is the basic syntax:
-- List = [output function | input set, predicate]


-- Some different cases:

-- take a list and return a list of those elements multiplied by two
[ 2*x | x <- [1, 2, 3] ]
 => [2, 4, 6]

-- same as above, except use a guard to filter which elements are used
[ 2*x | x <- [1, 2, 3], x > 1 ]
 => [4, 6]

-- another example, but this time we are filtering output
[ 2 * x | x <- [1..6], x * 2 > 10]
 => [10, 12]

-- an example with a different kind of outut function
[ if x `mod` 2 then "Even" else "Odd" | x <- [0..10] ]
 => ["Even", "Odd", "Even", "Odd", "Even", "Odd", "Even", "Odd", "Even", "Odd", "Even"]

-- example with multiple lists being turned into tuples
[ (x, y) | x <- [1, 2, 3], y <- ['a', 'b'] ]
 => [ (1, 'a'), (1, 'b'), (2, 'a'), (2, 'b'), (3, 'a'), (3, 'b') ]

-- multiple predicates can be used
[ x | x <- [1..10], x /= 3, x/= 7 ]
 => [1, 2, 4, 5, 6, 8, 9, 10]

-- so can multiple lists
-- this will calculate all the values
[ x*y | x <- [2,5,10], y <- [8,10,11]]
 => [16,20,22,40,50,55,80,100,110]

-- A fun learn u a good haskell example is
let nouns = ["hobo","frog","pope"]
let adjectives = ["lazy","grouchy","scheming"]
[adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
 => ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog", "grouchy pope","scheming hobo","scheming frog","scheming pope"]

-- Another example shows an easy way to calculate length of a list
-- it turns every element in a list into a one and adds them up
-- wildcard prevents unneccessary assignment of a value we don't care about
length` xs = sum [1 | _ <- xs]

-- Remove non-lowercase characters from a string
onlyLowerCase str = [c | c <- str, c `elem` ['a'..'z']


-- generally stated, important that this can be done on multiple lists and with multiple guards
[<gen> | <elem> <- <list>, ..., <guard>, ...]




-- List Patterns
--------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------
-- Have multiple elements in a pair, can have two or more elements
-- Two-element tuples = pairs
-- Three-element tuples = triples
-- 4 = 4-tuples, etc.

(1, 2, 3, n)

-- Useful for things like lists of vectors, where a list would not have a problem with
[ [1, 2], [3, 4, 5], [6, 7] ]
-- but the second list item would be an error and mess up calculations
-- A list of tuples can only have the same size, however
[ (1, 2), (3, 4), (5, 6) ]

-- tuples can also be used with mixed data types
("Andrew", "Barlow", 22)

-- zip
-- this function "zips" together two lists into pairs
zip [1,2,3,4,5] [5,5,5,5,5]
 => [ (1,5), (2,5), (3,5), (4,5), (5,5) ]

zip [1 .. 5] ["one", "two", "three", "four", "five"]
 => [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]

-- if there's a list length discrepency, the longer list gets cut off
zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
 => [(5,"im"),(3,"a"),(2,"turtle")]

-- fst
-- this function finds the first element in a tuple
fst (x, y)
 => x

-- snd
-- this one finds the second
snd (x, y)
 => y

-- Here's a definition of fst & snd (for learning purposes, they're already defined)
-- that uses pattern matching to find first and second vals of a tuple
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

-- heres a fun pythagorean problem from LYAGH
-- to find a list of tuples of side lengths for a right-angle triangle with sides
-- of length < 10 and whose perimeter == 24
let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
