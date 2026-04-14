{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

import Prelude.Linear

-- this should compile as-is
f :: Int %1-> Int
f x = 0 + x 

-- if uncommented, this function should not compile
f :: Int %1-> Int
f x = x + x
