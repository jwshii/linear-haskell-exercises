module NonLinearCake (Cake, bakeCake, eatCake) where

newtype Cake = Cake Bool

bakeCake :: Cake
bakeCake = (Cake False)

eatCake :: Cake -> ()
eatCake _ = ()