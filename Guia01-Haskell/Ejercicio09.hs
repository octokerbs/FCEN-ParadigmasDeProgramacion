sumaMat :: [[Int]] -> [[Int]] -> [[Int]]
sumaMat = foldr (\xs rec yss -> zipWith (+) xs (head yss) : rec (tail yss)) (const [])

trasponer :: [[Int]] -> [[Int]]
trasponer (xs : xss) = foldr (zipWith (:)) [[] | i <- [1 .. (length xs)]] xss
