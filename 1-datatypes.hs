-- DATATYPES
----------------------------------------------------

-- Haskell is good at guessing which datatype you are declaring, but it's still important to specify, as a best-practice/optimization/bug deterrance

myVar :: Type

-- this can now be defined

myVar = value


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
