-- Syntax
------------------------------------------

-- Guards
------------------------------------------
-- guards test the truth of a property or value or several of either
-- its very similar to an if statement, but more readable with many conditions
-- they also work well with patterns

bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
     | bmi <= 18.5 = "You're underweight, you emo, you!"  
     | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
     | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
     | otherwise   = "You're a whale, congratulations!"  

-- otherwise simply equals true. If nothing fits and no otherwise is given, it falls through
-- to the next pattern. If no suitable guards or patterns are found, it throws an error

-- Let
------------------------------------------
-- let statements bind variables
-- they can be used in functions with extremely local scope (they won't span across guards)
-- can be used for pattern matching (like anything used to bind values to names)

cylinder :: (RealFloat a) => a -> a -> a
cylender r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r^2
    in sideArea + 2 * topArea

-- in functions, their form is
-- let <bindings> in <expression>

-- where
------------------------------------------
-- where is put after the guards, and can bind values within the function
-- can also use pattern matching

bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
