max2 :: (Float, Float) -> Float
max2 (x, y)
  | x >= y = x
  | otherwise = y

normaVectorial :: (Float, Float) -> Float
normaVectorial (x, y) = sqrt (x ^ 2 + y ^ 2)

subtract2 :: Float -> Float -> Float
subtract2 = flip (-)

subtract2Curry :: (Float, Float) -> Float
subtract2Curry (x, y) = (-) y x

predecesor :: Float -> Float
predecesor = subtract2 1

predecesor2 :: (Float, a) -> Float
predecesor2 = predecesor . fst

evaluarEnCero :: (Float -> Float) -> Float
evaluarEnCero f = f 0

evaluarEnCero2 :: (Float -> Float, a) -> Float
evaluarEnCero2 = evaluarEnCero . fst

dosVeces :: (Float -> Float) -> Float -> Float
dosVeces f = f . f

dosVeces2 :: (Float -> Float, Float) -> Float
dosVeces2 (g, x) = dosVeces g x

flipAll :: [Float -> Float -> Float] -> [Float -> Float -> Float]
flipAll = map flip

flipAll2 :: ([Float -> Float -> Float], a) -> [Float -> Float -> Float]
flipAll2 = map flip . fst

flipRaro :: Float -> (Float -> Float -> Float) -> Float -> Float
flipRaro = flip flip

flipRaro2 :: (Float, Float -> Float -> Float, Float) -> Float
flipRaro2 (x, f, y) = flipRaro x f y
