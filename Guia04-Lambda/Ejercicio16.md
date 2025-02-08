i (λx: Bool. x) true

```
Si es un programa.

(λx: Bool. x) true ->β x{x := true} = true

Es un valor
```

ii λx: Nat. pred(succ(x))

```
Si es un programa.

λx: Nat. pred(succ(x))

Es un valor
```

iii λx: Nat. pred(succ(y))

```
No es un programa.
```

iv (λx: Bool. pred(isZero(x))) true

```
No tipa. (isZero devuelve bool y pred pide un nat)
```

v (λf : Nat → Bool. f zero) (λx: Nat. isZero(x))

```
Si es un programa.

(λf : Nat → Bool. f zero) (λx: Nat. isZero(x)) (notar que "(λx: Nat. isZero(x))" es un valor por lo que podemos usar la beta reduccion)
->β (f zero){f := (λx: Nat. isZero(x))}
= (λx: Nat. isZero(x)) zero
->β isZero(zero)
->isZero0 true

Es un valor.
```

vi (λf : Nat → Bool. x) (λx: Nat. isZero(x))

```
No es programa, x esta libre.
```

vii (λf : Nat → Bool. f pred(zero)) (λx : Nat. isZero(x))

```
Es un programa

(λf : Nat → Bool. f pred(zero)) (λx : Nat. isZero(x))
-> (f pred(zero)){f := (λx : Nat. isZero(x)) }
-> (λx : Nat. isZero(x)) pred(zero)
->ERROR. pred(zero) no es un valor.

es un error.
```

viii µy : Nat. succ(y)

```
Es un programa

µy : Nat. succ(y)
-> succ(y){y := µy : Nat. succ(y)}
= succ(µy : Nat. succ(y))...

Aunque no se porque es recursivo infinito.

```
