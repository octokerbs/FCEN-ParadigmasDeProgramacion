```haskell
zip = zip'

-- Por principio de extensionalidad funcional basta ver que ∀xs::[a]. ∀ys::[a].

-- Demostrar
zip xs ys = zip' xs ys

-- Por principio de induccion estructural sobre listas.

-- Demostrar
P(xs): zip xs ys = zip' xs ys

-- Caso base: P([])
zip [] ys
{Z0} = foldr (\x rec zs -> if null zs then [] else (x, head zs) : rec (tail zs)) (const []) [] ys
{F0} = (const []) ys
{CT} = []
{Z'0} = zip' [] ys

-- Caso inductivo:  ∀x::a. ∀xs::[a]. ∀ys::[a]. Usando P(xs) como hipotesis inductiva, quiero ver que P(x:xs).

-- Demostrar
P(x:xs): zip (x:xs) ys = zip' (x:xs) ys

f = (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys))

zip (x:xs) ys
{Z0} = foldr f (const []) (x:xs) ys
{F1} = f x (foldr f (const []) xs) ys
{FF} = if null ys then [] else (x, head ys) : foldr f (const []) xs (tail ys)
{Z0} = if null ys then [] else (x, head ys) : zip xs (tail ys)
{HI} = if null ys then [] else (x, head ys) : zip' xs (tail ys)
--Considerar que si algo vale para toda lista entonces, en particular, vale para la instancia de lista (tail ys).
{Z'1} = zip' (x:xs)
```
