{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Tests where

import Exercises (on1, on2)

-- These are the "test cases" for Exercise 2-2.
-- I recommend that you attempt the exercise without looking at these tests.

test_on1_maxLinear :: (b %1-> b %1-> c) %1-> (a %1-> b) -> a %1-> a %1-> c
test_on1_maxLinear = on1

test_on1_noneLinear :: (b -> b -> c) -> (a -> b) -> a -> a -> c
test_on1_noneLinear = on1

test_on2_a1Linear :: (b %1-> b -> c) -> (a %1-> b) -> a %1-> a -> c
test_on2_a1Linear = on2

test_on2_a2Linear :: (b -> b %1-> c) -> (a %1-> b) -> a -> a %1-> c
test_on2_a2Linear = on2