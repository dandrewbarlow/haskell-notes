-- Function Composition
----------------------------------------------------
-- Becuase of the properties of functions detailed in the file on higher order functions,
-- Haskell is able to "compose" functions using functions

-- The dot (.) operator takes two functions and a value, and returns another function

(.) :: (b -> c) -> (a -> b) -> a -> c

(f . g)
-- => (\x -> f (g x) )

-- given an ascending sorting function, "sort," and a reversing function, "reverse,"
-- you could create a descending sorting function
descSort = reverse . sort
descSort = (\x -> reverse (sort x) ) 
descSort x = reverse (sort x)

-- you could also create a 2 dimensional mapping function, using the normal mapping function
map2D :: (a -> b) -> [[a]] -> [[b]]
map2D = map . map

-- $$$ Dolla sign
$ :: (a -> b) -> a -> b

-- still a little iffy on the details, but it lets us clean up the syntax
f xs = map (\x -> x+1) (filter (\x -> x>1) xs)
f xs = map (\x -> x+1) $ filter (\x -> x>1) xs

