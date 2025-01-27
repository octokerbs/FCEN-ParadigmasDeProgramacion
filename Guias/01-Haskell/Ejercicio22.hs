listasInfinitasAIH :: [AIH ()]
listasInfinitasAIH = genAIH (Hoja ())

genAIH :: AIH () -> [AIH ()]
genAIH arbol = arbol : concatMap (\x -> genAIH (BinAIH x x)) (genAIH (Hoja ()))
