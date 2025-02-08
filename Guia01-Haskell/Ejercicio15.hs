data Rosetree a = Rose a [Rosetree a]

foldRT :: (a -> [b] -> b) -> Rosetree a -> b
foldRT f (Rose r hijos) = f r (map (foldRT f) hijos)

hojasRT :: Rosetree a -> [a]
hojasRT = foldRT (\r recHijos -> if null recHijos then [r] else concat recHijos)

distanciasRT :: Rosetree a -> [(a, Int)]
distanciasRT = foldRT (\r recHijos -> if null recHijos then [(r, 0)] else map (\(tree, distance) -> (tree, distance + 1)) (concat recHijos))

alturaRT :: Rosetree a -> Int
alturaRT = foldRT (\r recHijos -> if null recHijos then 0 else 1 + maximum recHijos)
