listasQueSuman :: Int -> [[Int]]
listasQueSuman 0 = [[]]
listasQueSuman n = [x : xs | x <- [1 .. n], xs <- listasQueSuman (n - x)]
