## 3.1

```haskell
∀xs::[a]. length (duplicar xs) = 2 * length xs

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): length (duplicar xs) = 2 * length xs

-- Caso base: P([])
length (duplicar [])
{D0} = length []
{L0} = 0
{--} = 2 * 0
{L0} = 2 * length []

-- Caso inductivo: ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): length (duplicar x:xs) = 2 * length x:xs

length (duplicar x:xs)
{D1} = length (x : x : duplicar xs)
{L1} = 1 + length (x : duplicar xs)
{L1} = 1 + 1 + length (duplicar xs)
{HI} = 1 + 1 + (2 * (length xs))
{--} = 2 + (2 * (length xs))
{--} = 2 * (1 + (length xs))
{L1} = 2 * length (x:xs)
```

## 3.2

```haskell
∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): length (append xs ys) = length xs + length ys

-- Caso base: P([])
length (append [] ys)
{A0} = length (ys)
{--} = 0 + length ys
{L0} = length [] + length ys

-- Caso inductivo:  ∀x::a. ∀xs::[a]. ∀ys::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): length (append x:xs ys) = length x:xs + length ys

length (append x:xs ys)
{A1} = length (x : append xs ys)
{L1} = 1 + length (append xs ys)
{HI} = 1 + length xs + length ys
{L1} = length x:xs + length ys
```

## 3.3

```haskell
∀ xs::[a] . ∀ x::a . [x]++xs = x:xs

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): [x]++xs = x:xs

-- Caso base: P([])
[x]++[]
{++} = foldr (:) [] [x]
{F1} = (:) x (foldr (:) [] [])
{F0} = (:) x []
{--} = x:[]

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): [x]++(x:xs) = x:(x:xs)

[x]++(x:xs)
{++} = foldr (:) (x:xs) [x]
{F1} = (:) x (foldr (:) (x:xs) [])
{F0} = (:) x (x:xs)
{--} = x:(x:xs)
```

## 3.4

```haskell
∀ xs::[a] . ∀ f::(a->b) . length (map f xs) = length xs

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): length (map f xs) = length xs

-- Caso base: P([])
length (map f [])
{M0} = length []

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): length (map f x:xs) = length x:xs

length (map f x:xs)
{M1} = length (f x : map f xs)
{L1} = 1 + length (map f xs)
{HI} = 1 + length xs
{L1} = length x:xs
```

## 3.5

```haskell
∀ xs::[a] . ∀ p::a->Bool . ∀ e::a . ((elem e (filter p xs)) ⇒ (elem e xs))

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): ((elem e (filter p xs)) ⇒ (elem e xs)) = True

-- Caso base: P([])
elem e (filter p []])
{F0} = elem e []
{E0} = False
-- Como (False => cualquier cosa) = True, entonces vale.

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): ((elem e (filter p x:xs)) ⇒ (elem e x:xs)) = True
{F1} = ((elem e (if p x then x : (filter p xs) else (filter p xs))) ⇒ (elem e x:xs))

-- Por principio de induccion sobre booleanos.

-- Caso p x = False
((elem e (filter p xs)) ⇒ (elem e x:xs))

---- Por principio de induccion sobre booleanos.

---- Caso (elem e x:xs) = True => No importa lo que valga (elem e (filter p xs)) igualmente da True la ecuacion.

---- Caso (elem e x:xs) = False => e tampoco pertenece a filter p xs => False => False = True

-- Caso p x = True
((elem e (x : filter p xs)) ⇒ (elem e x:xs))
{E1} = ((e == x | elem e (filter p xs)) ⇒ (e == x | elem e xs))

-- Por principio de induccion sobre booleanos.

---- Caso e == x = True
(True) ⇒ (True)
{--} = True

---- Caso e == x = False
((elem e (filter p xs)) ⇒ (elem e xs))
{HI} = True


```

## 3.6

```haskell
∀ xs::[a] . ∀ x::a . ponerAlFinal x xs = xs ++ (x:[])

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): ponerAlFinal x xs = xs ++ (x:[])

-- Caso base: P([])
ponerAlFinal x xs
{P0} = foldr (:) (x:[]) []
{++} = [] ++ (x:[])

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): ponerAlFinal x x:xs = x:xs ++ (x:[])

ponerAlFinal x x:xs
{P0} = foldr (:) (x:[]) (x:xs)
{++} = (x:xs) ++ (x:[])
```

## 3.7

```haskell
reverse = foldr (\x rec -> rec ++ (x:[])) []

-- Por principio de extensionalidad funcional basta ver que ∀xs::[a].

-- Demostrar
reverse xs = foldr (\x rec -> rec ++ (x:[])) [] xs

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): reverse xs = foldr (\x rec -> rec ++ (x:[])) [] xs

-- Caso base: P([])
reverse []
{R0}  = foldl (flip (:)) [] []
{FL0} = []
{FR0} = foldr (\x rec -> rec ++ (x:[])) [] []

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): reverse x:xs = foldr (\x rec -> rec ++ (x:[])) [] x:xs

foldr (\x rec -> rec ++ (x:[])) [] x:xs
{FR1} = (\x rec -> rec ++ (x:[])) x ( foldr (\x rec -> rec ++ (x:[])) [] xs)
{--}  = ( foldr ( \x rec -> rec ++ x:[] ) [] xs ) ++ x:[]
{HI}  = reverse xs ++ [x]

-- Llegamos a:
1. reverse x:xs
2. reverse xs ++ [x]

-- Queremos ver que son iguales, hacemos otra demostracion!
```

```haskell
∀x::[a].∀xs::[a]. reverse x:xs = reverse xs ++ [x]


```

## 3.8

```haskell
∀xs::[a] . ∀x::a . head (reverse (ponerAlFinal x xs)) = x

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): head (reverse (ponerAlFinal x xs)) = x

-- Caso base: P([])
head (reverse (ponerAlFinal x []))
{P0} = head (reverse (foldr (:) (x:[]) []))
{F0} = head (reverse [x])
{R0} = head (foldl (flip (:)) [] [x])
{F1} = head (foldl (flip (:)) ((flip (:)) [] x) [])
{--} = head (foldl (flip (:)) ((:) x []) [])
{--} = head (foldl (flip (:)) [x] [])
{F0} = head ([x])
{H0} = x

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): head (reverse (ponerAlFinal x x:xs)) = x

head (reverse (ponerAlFinal x y:ys))
{P0} = head ( reverse ( foldr (:) (x:[]) (y:ys) ) )
{F1} = head ( reverse ( (:) y ( foldr (:) (x:[]) ys ) ) )
{P0} = head ( reverse ( y : (ponerAlFinal x ys) ))
{R0} = head ( foldl (flip (:)) [] ( y : (ponerAlFinal x ys) ) )
{F1} = head ( foldl (flip (:)) ( (flip (:)) [] y ) (ponerAlFinal x ys) )
{--} = head ( foldl (flip (:)) y:[] (ponerAlFinal x ys) )
{--} = head (foldl (flip (:)) [y] (ponerAlFinal x ys))

```
