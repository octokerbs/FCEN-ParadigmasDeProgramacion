curry2 :: ((a, b) -> c) -> (a -> b -> c)
curry2 f a b = f (a, b)

uncurry2 :: (a -> b -> c) -> ((a, b) -> c)
uncurry2 f (a, b) = f a b