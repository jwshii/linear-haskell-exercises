{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Exercises where

import Prelude.Linear hiding (forget)

{-
Exercise 0:

Let's make sure the IDE is working as expected.

1. `ex1` should compile without error.

2. When un-commented, `ex2` should have an error. The error message
  should read: Couldn't match type 'Many' with 'One' ...

3. Make sure to re-comment `ex2` afterwards.
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

1. Read the (regular) definition of `chain`.
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

Let's practice with multiplicity polymorphism. In this exercise,
you will be modifying type signatures (by adding multiplicity
annotations) but leaving the implementations unchanged.

1. Write a multiplicity polymorphic version of the `both`
   function we saw during the lecture. Annotate arrows with
   multiplicity variables such that `both` compiles and supports
   these instantiations:
   * As many of the arrows as possible are linear (i.e., three).
   * As few of the arrows as possible are linear (i.e., zero).

   To check that your `both` satisfies these constraints, uncomment
   the two "test cases" and check that they compile without error.

2. Write two different multiplicity polymorphic versions of the
   `on` function.

   First, for `on1`, annotate arrows such that `on1` compiles and
   supports these instantiations:
   * As many of the arrows as possible are linear.
   * As few of the arrows as possible are linear.

   Second, for `on2`, annotate arrows such that `on2` compiles
   and supports instantiations (with the other pieces being
   linear or non-linear as appropriate) where:
   * `a1` is linear but `a2` is not.
   * `a2` is linear but `a1` is not.

   Check your work by running `cabal build` in the terminal. (The
   "hidden" test cases are in a separate file called `OnTests.hs`,
   which you can peek at if you get stuck.)
-}

-- Part 1:

both :: (a -> b) -> (a, a) -> (b, b)
both f (x1, x2) = (f x1, f x2)

-- Uncomment to test `both`:

-- test_both_noneLinear :: (a -> b) -> (a, a) -> (b, b)
-- test_both_noneLinear = both
-- test_both_maxLinear :: (a %1-> b) -> (a, a) %1-> (b, b)
-- test_both_maxLinear = both

-- Part 2:

on1 :: (b -> b -> c) -> (a -> b) -> a -> a -> c
on1 op f a1 a2 = op (f a1) (f a2)

on2 :: (b -> b -> c) -> (a -> b) -> a -> a -> c
on2 op f a1 a2 = op (f a1) (f a2)

-- Run `cabal build` to test `on1` and `on2`.

{-
Exercise 3:

Let's practice with unrestricted values.

For each of the type signatures below, decide whether it is
inhabited or not. If it is, implement a function with that type.
If it isn't, convince yourself why not.
-}

f1 :: (a, a) -> Ur a
f1 = undefined

f2 :: (a, a) %1-> a
f2 = undefined

f3 :: (Ur a, a) %1-> a
f3 = undefined

f4 :: (Ur a, Ur a) %1-> a
f4 = undefined

f5 :: (a, a) %1-> Ur a
f5 = undefined

{- Exercise 4: Go to `Cake.hs`. -}