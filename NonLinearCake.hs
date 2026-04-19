module NonLinearCake (Cake, bakeCake, eatCake, checkCakeMsg) where

newtype Cake = Cake Bool

bakeCake :: Cake
bakeCake = (Cake True)

eatCake :: Cake -> ()
eatCake _ = ()

-- Not used until Part 4.
checkCakeMsg :: Cake -> String
checkCakeMsg (Cake b) = if b then "ready" else "try again later"