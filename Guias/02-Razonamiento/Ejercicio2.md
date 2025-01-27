## 2.1

```haskell
flip . flip = id

-- Por principio de extensionalidad funcional basta ver que ∀f::a->b->c. ∀x::a. ∀y::b.

-- Demostrar
(flip . flip) f x y = id f x y

(flip . flip) f x y
{D.} = flip (flip f x y)
{F1} = flip f y x
{F1} = f x y
{ID} = id f x y
```

## 2.2

```haskell
∀f::(a,b)->c. uncurry (curry f) = f

-- Por principio de extensionalidad funcional basta ver que ∀f::(a,b)->c. ∀p :: (a,b).

-- Demostrar
uncurry (curry f) p = f p

-- Por principio de extensionalidad para pares basta ver que ∀f::(a,b)->c. ∀p :: (a,b). ∃x::a. ∃y::b. p = (x,y).

-- Demostrar
uncurry (curry f) (x,y) = f (x,y)

uncurry (curry f) (x,y)
{U1} = (curry f) x y
{C1} = f (x,y)
```

## 2.3

```haskell
flip const = const id

-- Por principio de extensionalidad funcional basta ver que ∀x::a. ∀y::b.

-- Demostrar
flip const x y = const id x y

flip const x y
{F1} = const y x
{CS} = y
{CS} = const x y
{ID} = const (id x) y
```

## 2.4

```haskell
∀f::a->b. ∀g::b->c. ∀h::c->d. ((h.g).f) = (h.(g.f))

-- Por principio de extensionalidad funcional basta ver que ∀f::a->b. ∀g::b->c. ∀h::c->d. ∀x::a.

-- Demostrar
((h.g).f) x = (h.(g.f)) x

((h.g).f) x
{D.} = (h.g) (f x)
{D.} = h (g(f x))
{D.} = h ((g.f) x)
{D.} = (h.(g.f)) x
```
