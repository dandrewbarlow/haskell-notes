-- Higher Order Functions
----------------------------------------------------------------
-- Another interesting feature of haskell is something referred to
-- as "Higer Order Functions."
-- Functions can only take one argument
-- So why are there functions with multiple arguments?
-- These are functions returning new functions a.k.a. higher order functions

-- this function is not actually taking two arguments 
-- it takes one argument, x, and returns a function which takes another argument, y 
-- then it multiplies them and returns this result
multiply :: (Num a) => a -> a -> a
multiply x y = x * y

-- this can be leveraged to create interesting combinations of functions
-- these are often constructed using partials of functions, like so
let mult2 n = multiply 2

mult2 2
-- => 4

-- Anonymous Functions
--------------------------------------------------------
-- an anonymous function is a function without a name
-- it's written in the form
-- (\<args> -> <expr>)
(\x -> x ^ 2)
-- it can also have multiple argument without needing more backslashes
(\x y -> x ^ 2 + y)

-- Important function that is passed a function and a list and maps it to a new list
-- This function showcases both higher order functions and anonymous functions
map :: (a -> b) -> [a] -> [b]
map (\x -> x^2) [1..10]
-- => [1,4,9,16,25,36,49,64,81,100]

-- A key learning point for functions is that they are defined as values in Haskell,
-- meaning that they have no special differentiation from anything else that is defined
-- or passed. Like I've said, this is a simple difference from other language that allows
-- complex behavior

-- Another important one is filter, which is provided an anonymous function which creates a
-- Bool (often a conditional) which must be satisfied for values to remain in a list
filter :: (a -> Bool) -> [a] -> [a]
filter (\x -> x > 2) [1..5]
-- => [3, 4, 5]

-- Partial Function Application / Currying
--------------------------------------------------------------
-- Expanding on the idea of functions taking single arguments and returning another function
-- This is called currying

-- Take this function as an example
-- it takes 3 arguments and returns a third
f :: a -> b -> c -> d

-- in Haskell, this could be rewritten as 
f:: a -> (b -> (c -> d))
-- which is to say 3 functions, each taking one argument
-- the key point is that there are not really multiple arguments at all
-- it is a clever way to simulate this behavior

-- This is useful for allowing different ways to write functions
-- Once again these are all equivalent
add :: Int -> Int -> Int
add x y = x + y
add x = (\y -> x + y)
add = (\x -> (\y -> x + y))

-- So what happens when you only use one argument?
add 1
-- => ?
-- this returns a function!
-- add 1 :: Int -> Int
-- => (\y -> 1 + y)

-- this creates a function that takes a list and doubles it, by using map's funcionality
-- cool, right!
double list = map (\x -> 2 * x)


