{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Cake where

import Prelude.Linear
import qualified NonLinearCake as NL
import qualified LinearCake as L

{-
Exercise 4:

Suppose we have a datatype Cake, representing cake.
Its API (defined in `NonLinearCake.hs`) is given as follows:

bakeCake :: Cake
eatCake :: Cake -> ()

An unfortunate aspect of this API is that we can bake a cake, eat
it, and then return the original cake.
-}

-- This is fine, and compiles:
justEatCake :: ()
justEatCake = NL.eatCake NL.bakeCake

-- This is bad, but compiles:
eatCakeAndHaveItToo :: NL.Cake
eatCakeAndHaveItToo =
  let c = NL.bakeCake
  in NL.eatCake c `seq` c

{-
Let's use linear types to enforce some constraints around Cakes.
In particular, we will build towards a world where:
1. If you eat a cake, you no longer have it.
2. If you bake a cake, you have to eat it.

We will do so by gradually modifying the API defined in
`LinearCake.hs` — currently, it's the same as `NonLinearCake.hs`.

Some quick notes about exports and imports:
* Both files export the type Cake, and the functions bakeCake and
  eatCake. They do *not* export the constructor for Cakes, so
  that the only way to create a Cake is through the API.
* In this file, we differentiate the two Cake APIs by using
  qualified imports. Everything pertaining to `NonLinearCake`
  should be prefixed with `NL`, as seen above, and everything
  pertaining to `LinearCake` should be prefixed with `L`.
-}

{-
Part 1:

We'll start with something that won't quite work, but it'll be a
step in the right direction.

In `LinearCake.hs`:
* Change the type of `eatCake` to be `Cake %1-> ()`.
* Fix the implementation of `eatCake` so that it compiles again.

Unfortunately, our problem persists. We can still return a cake
after eating it; that is, the example below will still compile:
-}

-- This is fine, and compiles:
justEatCake' :: ()
justEatCake' = L.eatCake L.bakeCake

-- This is bad, but still compiles:
eatCakeAndHaveItToo' :: L.Cake
eatCakeAndHaveItToo' =
  let c = L.bakeCake
  in L.eatCake c `seq` c

{-
Note: When you transition to Part (n + 1), re-comment the
examples in Part n, and un-comment those in Part (n + 1).
-}

{-
Part 2:

Why does this still compile? The %1-> we added enforces that
`L.eatCake` use its argument exactly once. But that doesn't
prevent us from using the `c` we passed to `L.eatCake` again.

We need some way of enforcing that the _output_ of L.bakeCake is
used exactly once. However, the linear annotations we have seen
are on _arrows_, affecting the preceding argument.

How do we get around this? With continuations. We can change the
type of `bakeCake` to be `(Cake %1-> b) -> b`.

Now, instead of `bakeCake` returning a Cake directly, it accepts
a function that takes a Cake as input, and it enforces that this
function use the Cake linearly.

In `LinearCake.hs`:
* Change the type of `bakeCake` to be `(Cake %1-> b) -> b`.
* Fix the implementation of `bakeCake` so that it compiles again.

Check that the examples below are working as expected. The second
one should now have a multiplicity mismatch error on `c`.

(Do you understand why having a linear arrow in both `bakeCake`
and `eatCake` is necessary?)
-}

-- -- This is fine, and compiles:
-- justEatCake'' :: ()
-- justEatCake'' = L.bakeCake (\c -> L.eatCake c)

-- -- This is bad, and does not compile:
-- eatCakeAndHaveItToo'' :: L.Cake
-- eatCakeAndHaveItToo'' = L.bakeCake (\c -> L.eatCake c `lseq` c)

{-
Part 3:

Sadly, there is still a way for our cake to escape. Observe that
`L.bakeCake (\c -> c)` typechecks, and results in a `Cake` that
is not linearly constrained.

Can you figure out how to prevent this from happening?

In `LinearCake.hs`:
* Change the type of `bakeCake`. Hint: use `Ur`.
* Fix the implementation of `bakeCake` so that it compiles again.

Below:
* Fix the implementation of `justEatCake'''` so that it compiles
  again. It may help to use `lseq` (which was also used in Part 2).
* Make sure `eatCakeAndHaveItToo'''` no longer compiles.

Indeed, there should be no way to implement this using your API:
  myCake :: Cake
  myCake = ______
-}

-- -- Fix the body so that it compiles with your new API:
-- justEatCake''' :: ()
-- justEatCake''' = L.bakeCake (\c -> L.eatCake c)

-- -- Make sure this no longer compiles:
-- eatCakeAndHaveItToo''' :: L.Cake
-- eatCakeAndHaveItToo''' =
--   let c = L.bakeCake id
--   in L.eatCake c `seq` c