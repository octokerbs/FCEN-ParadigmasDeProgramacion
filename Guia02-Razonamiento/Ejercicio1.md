## 1.1

```haskell
∀p::(a,b). intercambiar (intercambiar p) = p

-- Por principio de extensionalidad para pares basta ver que ∀p :: (a,b). ∃x::a. ∃y::b. p = (x,y).

-- Demostrar
intercambiar (intercambiar (x,y)) = (x,y)

intercambiar (intercambiar (x,y))
{I1} = intercambiar (y,x)
{I1} = (x,y)
{EP} = p
```

## 1.2

```haskell
∀p::(a,(b,c)). asociarD (asociarI p) = p

-- Por principio de extensionalidad para pares basta ver que ∀p :: (a,d). ∃x::a. ∃w::d. p = (x,w).

-- Demostrar
asociarD (asociarI (x,w)) = (x,w)

-- Por principio de extensionalidad para pares basta ver que ∀w :: (b,c). ∃y::b. ∃z::c. w = (y,z).

-- Demostrar
asociarD (asociarI (x,(y,z))) = (x,(y,z))

asociarD (asociarI (x,(y,z)))
{A1} = asociarD ((x,y),z)
{AD} = (x,(y,z))
{EP} = p
```

## 1.3

```haskell
∀p::Either a b. espejar (espejar p) = p

-- Por principio de extensionalidad para sumas basta ver que ∀p :: Either a b.
-- o bien ∃x::a. p = Left x
-- o bien ∃y::b. p = Right y

-- Demostrar
espejar (espejar p) = p

-- Caso p = Left x
espejar (espejar Left x)
{E1} = espejar Right x
{E2} = Left x
{EP} = p

-- Caso p = Right y
espejar (espejar Right y)
{E2} = espejar Left y
{E1} = Right y
{EP} = p
```

## 1.4

```haskell
∀x::a. ∀ y::b. flip (flip f) x y = f x y

-- Demostrar
flip (flip f) x y = f x y

flip (flip f) x y
{F1} = (flip f) y x
{F1} = f x y
```

## 1.5

```haskell
∀f::a->b->c. ∀x::a. ∀y::b. curry (uncurry f) x y = f x y

-- Demostrar
curry (uncurry f) x y = f x y

curry (uncurry f) x y
{C1} = (uncurry f) (x,y)
{U1} = f x y
```
