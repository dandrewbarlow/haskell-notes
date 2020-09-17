-- Andrew Barlow
-- import Data.List
-- 
-- Excersise 1: create a function elem that returns True if an 
-- element is in a given list and returns False otherwise
elem :: (Eq a) => a -> [a] -> Bool

-- not sure about syntax for this one, but trying a recursive implementation

--elem a list =
-- | head(list) == a
-- | otherwise elem tail(list)

-- his implementation. it is better. It has pattern matching & boolean operators
elem _ [] = False
elem e (x:xs) = (e == x) || (elem e xs)

main =
 elem :: (Eq a) => a -> [a] -> Bool
 elem _ [] = False
 elem e (x:xs) = (e == x) || (elem e xs)
 elem 4 [1, 2, 3, 4, 5]
 elem 8 [1, 2, 3, 4, 5]
