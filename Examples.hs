{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE NoImplicitPrelude #-}

import Prelude.Linear

-- this should compile as-is
f :: Int %1-> Int
f x = 0 + x

-- if uncommented, this function should not compile
-- g :: Int %1-> Int
-- g x = x + x
