genLista :: a -> (a -> a) -> Integer -> [a]
genLista startElement incrementFunction size = foldl (\acc x -> if null acc then [startElement] else acc ++ [incrementFunction (last acc)]) [] [1 .. size]

desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta inicio fin = genLista inicio (+ 1) (fin - inicio) ++ [fin]
