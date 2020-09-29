-- https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems

testList = [1..10]

-- 1
-- Find the last element of a list.
myLast :: [a] -> a
myLast [x] = x
myLast (x:xs) = myLast xs

-- 2
-- Find the 2nd to last element of a list.
myButLast :: [a] -> a
myButLast [n, l] = n
myButLast (x:xs) = myButLast xs

-- 3
-- Find the K'th element of a list. The first element in the list is number 1.
elementAt :: [a] -> Int -> a
-- solution uses !!, which was new to me
-- !! indexes lists, but uses a 0 index so we subtract one from k
elementAt list k = list !! (k-1)

-- 4
-- Find the number of elements of a list. 
myLength :: [a] -> Int
-- borrowing a trick from one of the tutorials
myLength list = sum [1 | _ <- list]

-- 5 
-- Reverse a list
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

-- 6
-- Find out whether a list is a palindrome (can be read forward or backward)
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome list = (head list) == (last list) && (isPalindrome $ init $ tail list)
