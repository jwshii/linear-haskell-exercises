{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

import Prelude.Linear

{-
Exercise 0:

Let's make sure the IDE is working as expected.

1. ex1 should compile without error.

2. When un-commented, ex2 should have an error. The error message
  should read: Couldn't match type 'Many' with 'One' ...

3. Make sure to re-comment ex2 afterwards.
-}

-- This function typechecks.
ex1 :: Int %1-> Int
ex1 x = 0 + x

-- This function does not.
-- ex2 :: Int %1-> Int
-- ex2 x = x + x

{-
Exercise 1:

Let's decide which programs typecheck.

1. Read the (regular) definition of chain.
   Make sure you understand what it's doing.

2. For each of the variants below:

   First, ask yourself: Will this typecheck? Why or why not?
   (Note: Only the type signatures change between variants.)

   Then, uncomment the variant to see if you were correct.
-}

-- Regular:
chain :: [a -> a] -> a -> a
chain [] x = x
chain (f : fs) x = chain fs (f x)

-- Variant 1:
-- chain1 :: [a -> a] -> a %1-> a
-- chain1 [] x = x
-- chain1 (f : fs) x = chain1 fs (f x)

-- Variant 2:
-- chain2 :: [a %1-> a] -> a -> a
-- chain2 [] x = x
-- chain2 (f : fs) x = chain2 fs (f x)

-- Variant 3:
-- chain3 :: [a -> a] %1-> a -> a
-- chain3 [] x = x
-- chain3 (f : fs) x = chain3 fs (f x)

-- Variant 4:
-- chain4 :: [a %1-> a] -> a %1-> a
-- chain4 [] x = x
-- chain4 (f : fs) x = chain4 fs (f x)

-- Variant 5:
-- chain5 :: [a %1-> a] %1-> a %1-> a
-- chain5 [] x = x
-- chain5 (f : fs) x = chain5 fs (f x)

{-
Exercise 2:

[TODO multiplicity polymorphism with foldr]
-}

{-
Exercise 3:

Implement something with this type TODO
-}

f1 :: (a, Ur b) %1-> a
f1 = error "implement me"

-- TODO

{-
Exercise 4:

Implement f such that the first one typechecks but the second doesn't TODO
-}

-- TODO

