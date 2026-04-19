{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

module LinearCake (Cake, bakeCake, eatCake, checkCakeMsg) where

import Prelude.Linear

-- Don't modify this:
newtype Cake = Cake Bool

-- You can modify anything below here:

bakeCake :: Cake
bakeCake = (Cake True)

eatCake :: Cake -> ()
eatCake _ = ()

-- Not used until Part 4:
checkCakeMsg :: Cake -> String
checkCakeMsg (Cake b) = if b then "ready" else "try again later"