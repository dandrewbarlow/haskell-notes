-- Andrew Barlow

-- a factorial function
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

-- a circumference function
circumference :: Float -> Float
circumference r = 2 * pi * r
