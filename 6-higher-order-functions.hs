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
