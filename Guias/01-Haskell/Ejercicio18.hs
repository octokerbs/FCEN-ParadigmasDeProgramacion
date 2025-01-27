paresDeNat :: [(Int, Int)]
paresDeNat = [(b, c) | a <- [0 ..], b <- [0 .. a], c <- [0 .. a], b + c == a]
