data Polinomio a
  = X
  | Cte a
  | Suma (Polinomio a) (Polinomio a)
  | Prod (Polinomio a) (Polinomio a)

foldPoli :: b -> (a -> b) -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPoli casoX casoCte casoSuma casoProd polinomio =
  case polinomio of
    X -> casoX
    Cte n -> casoCte n
    Suma p q -> casoSuma (acc p) (acc q)
    Prod p q -> casoProd (acc p) (acc q)
  where
    acc = foldPoli casoX casoCte casoSuma casoProd

evaluar :: (Num a) => a -> Polinomio a -> a
evaluar n = foldPoli n id (+) (*)
