{-
  Andrew Barlow
  github.com/dandrewbarlow

  This is my intro to Haskell. I'm writing this and learning simultaneously, and will try to fix any mistakes I make, (of which I expect many). After getting a little bit into my tutorial and encountering some of Haskell's eccentricities, I wanted to come back and take note for myself, and maybe for anyone who reads this (you could do better, but I appreciate you).

  Haskell is a functional programming language. I've written more about what this means in the file on functions, but it is Haskell's big draw. Its pure functions baybee. No loops, no goto's, no variables even. Just pure, freebased functions, in the mathematical sense. You take an input, put it in a function, and it reterns a seperate output.

  Haskell's syntax is different.
  f(x) becomes f x
  f(x,y) becomes f x y

  Haskell uses recursion heavily instead of loops

  Haskell is statically typed and compiled. It is lazily evaluated (meaning that it doesn't compute a value until it specifically has to know said value). In the right circumstances it can be faster than C, in part because these constrictions allow for hardcore optimization, parallelization, and other special sauces that can create a powerhouse of a language.
-}
