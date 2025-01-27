pitagóricas :: [(Integer, Integer, Integer)]
pitagóricas = [(b, a, c) | a <- [1 ..], b <- [1 .. a], c <- [1 .. a + b], a ^ 2 + b ^ 2 == c ^ 2]

