-- DATATYPES
----------------------------------------------------

-- Haskell is good at guessing which datatype you are declaring, but it's still important to specify, as a best-practice/optimization/bug deterrance

myVar :: Type

-- this can now be defined

myVar = value

-- to find what type a variable is, you can run
:t myVar

-- Bool - True / False
-- Worth noting that the operator usually called as != in other languages is /= in this language. that is '/'+'='. My nerd-font concatenates them but I get the idea

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


-- There is also something called a type variable
-- it's used when the type returned is ambiguous
-- for example getting the head element of a list (see file on lists for more info)
:t head
head :: [a] -> a
-- a could be any datatype that is in the list and any type that is returned
-- these are called polymorphic functions

-- See the funtions file for more info on what this means

-- TYPECLASSSES
---------------------------------------------------
:t (==)
=> (==) :: (Eq a) => a -> a -> Bool
-- (Eq a) is a class constraint. I'm going to cut & paste LYAGH's explanation
-- bc its a lot of info, and she says it better than I could
-- Sorry for the wall of text

{-
 - We see a new thing here, the => symbol.
 - Everything before the => symbol is called a class constraint.
 - We can read the previous type declaration like this:
 - the equality function takes any two values that are of the same type and returns a Bool.
 - The type of those two values must be a member of the Eq class (this was the class constraint).

 - The Eq typeclass provides an interface for testing for equality.
 - Any type where it makes sense to test for equality between two values of that type should be a member of the Eq class.
 - All standard Haskell types except for IO (the type for dealing with input and output) and functions are a part of the Eq typeclass.

 - Ord is for types that have an ordering.
 - All the types we covered so far except for functions are part of Ord.
 - Ord covers all the standard comparing functions such as >, <, >= and <=.
 - The compare function takes two Ord members of the same type and returns an ordering.
 - Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively.
 - To be a member of Ord, a type must first have membership in the prestigious and exclusive Eq club.

 - Members of Show can be presented as strings. All types covered so far except for functions are a part of Show. The most used function that deals with the Show typeclass is show. It takes a value whose type is a member of Show and presents it to us as a string.

 - Read is sort of the opposite typeclass of Show. The read function takes a string and returns a type which is a member of Read.

 - Enum members are sequentially ordered types — they can be enumerated. The main advantage of the Enum typeclass is that we can use its types in list ranges. They also have defined successors and predecesors, which you can get with the succ and pred functions. Types in this class: (), Bool, Char, Ordering, Int, Integer, Float and Double.

 - Bounded members have an upper and a lower bound.

 - Num is a numeric typeclass. Its members have the property of being able to act like numbers. Let's examine the type of a number.

 - Integral is also a numeric typeclass. Num includes all numbers, including real numbers and integral numbers, Integral includes only integral (whole) numbers. In this typeclass are Int and Integer.

 - Floating includes only floating point numbers, so Float and Double.

 - A very useful function for dealing with numbers is fromIntegral. It has a type declaration of fromIntegral :: (Num b, Integral a) => a -> b. From its type signature we see that it takes an integral number and turns it into a more general number. That's useful when you want integral and floating point types to work together nicely.
 - Notice that fromIntegral has several class constraints in its type signature. That's completely valid and as you can see, the class constraints are separated by commas inside the parentheses.
 -}
