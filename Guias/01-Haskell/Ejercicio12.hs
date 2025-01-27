data AB a = Nil | Bin (AB a) a (AB a)

foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
foldAB casoNil casoBin arbol = case arbol of
  Nil -> casoNil
  Bin i r d -> casoBin (ac i) r (ac d)
  where
    ac = foldAB casoNil casoBin

recAB :: b -> (a -> AB a -> AB a -> b -> b -> b) -> AB a -> b
recAB z _ Nil = z
recAB z f (Bin izq r der) = f r izq der (recAB z f izq) (recAB z f der)

esNil :: AB a -> Bool
esNil Nil = True
esNil _ = False

alturaAB :: AB a -> Int
alturaAB = foldAB 0 (\recIzq r recDer -> 1 + max recIzq recDer)

cantNodosAB :: AB a -> Int
cantNodosAB = foldAB 0 (\recIzq r recDer -> 1 + recIzq + recDer)

mejorSegun2 :: (a -> a -> Bool) -> AB a -> a
mejorSegun2 f (Bin izq r der) = foldAB r (\recIzq r recDer -> if f r recIzq && f r recDer then r else if f recIzq recDer then recIzq else recDer) (Bin izq r der)

esABB :: (Ord a) => AB a -> Bool
esABB = recAB True (\r izq der recIzq recDer -> mayor izq r && menor der r && recIzq && recDer)
  where
    mayor Nil _ = True
    mayor (Bin _ x _) y = x <= y
    menor Nil _ = True
    menor (Bin _ x _) y = y <= x
