ramas :: AB a -> [[a]]
ramas = foldAB [] (\recIzq r recDer -> if null recIzq && null recDer then [[r]] else map (r :) (recIzq ++ recDer))

mismaEstructura :: AB a -> AB b -> Bool
mismaEstructura = foldAB esNil (\recIzq r recDer arbol -> not (esNil arbol) && recIzq (hijoIzquierdo arbol) && recDer (hijoDerecho arbol))

hijoIzquierdo :: AB a -> AB a
hijoIzquierdo (Bin izq _ _) = izq

hijoDerecho :: AB a -> AB a
hijoDerecho (Bin _ _ der) = der
