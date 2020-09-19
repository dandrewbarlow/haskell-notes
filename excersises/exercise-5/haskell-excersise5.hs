-- Andrew Barlow

import Data.List

-- Excersise 1: create a function elem that returns True if an 
-- element is in a given list and returns False otherwise
myElem :: (Eq a) => a -> [a] -> Bool

-- not sure about syntax for this one, but trying a recursive implementation

{-
myElem e list
    | head(list) == e = True
    | null(list) == True = False
    | otherwise = myElem e tail(list)
-}

-- After a lot of fiddling with ghc, this is my answer. Still not as good as his but I'll take a win when I can
-- update: apparently this has an "error" aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
{-
myElem e (x:xs)
    | x == e = True
    | null(xs) = False
    | otherwise = myElem e xs
-}

-- his implementation. it is better. It has pattern matching & boolean operators
myElem _ [] = False
myElem e (x:xs) = (e == x) || (myElem e xs)


-- Excersise 2: create a function nub, which removes all duplicates from a given list

myNub :: (Eq a) => [a] -> [a]

-- his solution. once again much better that what I was thinking so I'm disregarding said attempt to focus
-- on this pure functional programming
myNub [] = []
myNub (x:xs)
    | x `myElem` xs = myNub xs
    |otherwise = x : myNub xs

-- Excersise 3: create function isAsc that returns True if the list given is of ascending order
-- This solution also belongs to him, but this time I explicitly blame him for asking a question whose answer's syntax has not been covered yet
isAsc :: [Int] -> Bool

isAsc [] = False
isAsc [x] = True
isAsc (x:y:xs)
 | (x <= y) && isAsc (y:xs)

