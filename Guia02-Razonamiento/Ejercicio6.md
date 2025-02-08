## 6.1

```haskell
Eq a => ∀xs::[a]. ∀e::a. ∀p::a -> Bool. elem e xs && p e = elem e (filter p xs)

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): elem e xs && p e = elem e (filter p xs)

-- Caso base: P([])

-- Lado izquierdo
elem e [] && p e
{E0} = False && p e
{&&} = False

-- Lado derecho
elem e (filter p [])
{F0} = elem e []
{E0} = False

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): elem e x:xs && p e = elem e (filter p x:xs)
-- Lado Izquierdo
elem e (x:xs) && p e
-- Lado Derecho
elem e (filter p x:xs)
{F1} = elem e (if p x then x : filter p xs else filter p xs)

-- Por principio de induccion sobre booleanos.

--- Caso (p x = True).
--- Lado Izquierdo
elem e (x:xs) && p e
--- Lado derecho
elem e (if True then x : filter p xs else filter p xs)
{IF} = elem e (x : filter p xs)
{E1} = (e == x || elem e (filter p xs))
{HI} = (e == x || (elem e xs && p e) )
{||} = (e == x || elem e xs) && (e == x || p e)
{E1} = elem e (x:xs) && (e == x || p e)

--- Por principio de induccion sobre booleanos.

---- Caso: (p x = True), (e == x = False)
---- Lado Izquierdo
elem e (x:xs) && (p e)
---- Lado derecho
elem e (x:xs) && (False || p e)
{||} = elem e (x:xs) && (p e)

---- Caso: (p x = True), (e == x = True)
---- Lado Izquierdo
elem e (x:xs) && (p e)
{==} = elem e (x:xs) && (p x) -- Porque e == x. p x = True
{&&} = elem e (x:xs)
---- Lado derecho
elem e (x:xs) && (True || p e)
{||} = elem e (x:xs) && True
{&&} = elem e (x:xs)


--- Caso: (p x = False).
--- Lado Izquierdo
elem e (x:xs) && p e
{E1} = (e == x || elem e xs) && p e
{||} = (e == x && p e) || (elem e xs && p e)
--- Lado derecho
elem e (if False then x : filter p xs else filter p xs)
{IF} = elem e (filter p xs)
{HI} = elem e xs && p e

---- Caso: (p x = False) y (e == x = True)
---- Lado Izquierdo
(True && p e) || (elem e xs && p e)
{&&} = (p e) || (elem e xs && p e)
{==} = (False) || (elem xs && False) -- p e = p x = False
{--} = False
---- Lado derecho
elem e xs && p e
{==} = elem e xs && False
{&&} = False
```

## 6.2

```haskell
Eq a => ∀ xs::[a] . ∀ e::a . elem e xs = elem e (nub xs)

-- Por principio de induccion estructural sobre listas.

-- Demostrar:
P(xs): elem e xs = elem e (nub xs)

-- Caso base: P([])
-- Lado izquierdo
elem e []
{E0} = False
-- Lado derecho
elem e (nub [])
{N0} = elem e []
{E0} = False

-- Caso inductivo:  ∀x::a. ∀xs::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar:
P(x:xs): elem e x:xs = elem e (nub x:xs)
-- Lado izquierdo
elem e x:xs
{E1} = (e == x || elem e xs)
{HI} = (e == x || elem e (nub xs))
-- Lado derecho
elem e (nub x:xs)
{N1} = elem e (x : filter (\y -> x /= y) (nub xs))
{E1} = (e == x || filter (\y -> x /= y) (nub xs))

-- Por principio de induccion sobre booleanos

-- Caso: e == x = True
-- Lado Izquierdo
(e == x || elem e (nub xs))
{DEF} = (True || elem e (nub xs))
{||}  = True
-- Lado Derecho
(e == x || filter (\y -> x /= y) (nub xs))
{DEF} = (True || filter (\y -> x /= y) (nub xs))
{||}  = True

-- Caso: e == x = False
-- Lado Izquierdo
(e == x || elem e (nub xs))
{DEF} = (False || elem e (nub xs))
{||}  = elem e (nub xs)
-- Lado Derecho
(e == x || filter (\y -> x /= y) (nub xs))
{DEF} = (False || filter (\y -> x /= y) (nub xs))
{||}  = filter (\y -> x /= y) (nub xs)

```
