{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

module LinearCake (Cake, bakeCake, eatCake) where

import Prelude.Linear

-- Don't modify this:
newtype Cake = Cake Bool

-- You can modify anything below here:

bakeCake :: Cake
bakeCake = (Cake False)

eatCake :: Cake -> ()
eatCake _ = ()

