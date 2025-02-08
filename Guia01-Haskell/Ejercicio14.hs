data AIH a = Hoja a | BinAIH (AIH a) (AIH a)

foldAIH :: (b -> b -> b) -> (a -> b) -> AIH a -> b
foldAIH _ z (Hoja r) = z r
foldAIH f z (BinAIH izq der) = f (foldAIH f z izq) (foldAIH f z der)

alturaAIH :: AIH a -> Integer
alturaAIH = foldAIH (\recIzq recDer -> 1 + max recIzq recDer) (const 0)

tamano :: AIH a -> Integer
tamano = foldAIH (+) (const 1)
