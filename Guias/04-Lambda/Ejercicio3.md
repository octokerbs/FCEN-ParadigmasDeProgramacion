a) Por _alfa equivalencia_ el termino "λx: Nat. succ((λx: Nat. x) x)" es igual al termino "λy: Nat. succ((λz: Nat. z) y)" implicando que x no tiene ninguna ocurrencia como subtermino.

b) Ocurre x1 como subtérmino en λx1 : Nat. succ(x2)? No, tampoco.

c) Ocurre x (y z) como subtérmino en u x (y z)? No porque u x (y z) = (u x) (y z). La aplicacion asocia a izquierda.
