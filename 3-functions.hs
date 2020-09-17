-- FUNCTIONS
------------------------------------------

-- If add is defined as:
add a b = a + b
-- These two statements are equivalent
add 10 20
10 `add` 20


-- the following functions all do the same thing in different ways
in_range min max x =
	x >= min && x <= max

in_range min max x =
  let in_lower_bound = min <= x
	let in_upper_bound = max >= x
	in
		in_lower_bound && in_upper_bound

in_range min max x = ilb && iub
	where
		ilb = min <= x
		iub = max >= x

in_range min max x =
	if ilb then iub else False
	where
		ilb = min <= x
		iub = max >= x
