{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

module LinearCake (Cake, bakeCake, eatCake, checkCakeMsg) where

import Prelude.Linear

-- Don't modify this:
newtype Cake = Cake Bool

-- You can modify anything below here:

bakeCake :: (Cake %1-> Ur b) -> b
bakeCake f = unur (f (Cake True))

eatCake :: Cake %1-> ()
eatCake (Cake b) = if b then () else ()

-- Not used until Part 4:
checkCakeMsg :: Cake %1-> (Ur String, Cake)
checkCakeMsg (Cake b) = if b then (Ur "ready", Cake True) else (Ur "try again later", Cake False)