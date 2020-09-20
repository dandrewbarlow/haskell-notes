-- Folding
--------------------------------------------
-- A useful operation on lists

-- foldr = fold right
foldr :: (a -> b -> b) -> b -> [a] -> b

-- official definition
-- f = binary function
-- a = accumulator
-- xn = list
foldr (f) a [x1, x2, ..., xn] = x1 f x2 f ... f xn f a

-- prime example is summing a list
foldr (+) 0 [1, 2, ..., n]
-- => 1 + 2 + ... + n + 0

-- some easy ways to create partial functions for lists
sum = foldr (+) 0
and = foldr (&&) True
or = foldr (||) False

-- foldr (\elem acc -> <term>) <start_acc> <list>


