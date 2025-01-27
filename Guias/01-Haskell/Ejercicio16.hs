data HashSet a = Hash (a -> Integer) (Integer -> [a])

vacio :: (a -> Integer) -> HashSet a
vacio f = Hash f (const [])

pertenece :: (Eq a) => a -> HashSet a -> Bool
pertenece x (Hash f tabla) = x `elem` tabla (f x)

agregar :: (Eq a) => a -> HashSet a -> HashSet a
agregar x (Hash f tabla) = Hash f nuevaTabla
  where
    nuevaTabla n =
      if n == f x
        then
          if x `elem` tabla n
            then tabla n
            else x : tabla n
        else
          tabla n

interseccion :: (Eq a) => HashSet a -> HashSet a -> HashSet a
interseccion (Hash f tabla1) (Hash _ tabla2) = Hash f nuevaTabla
  where
    nuevaTabla n = filter (\x -> pertenece x (Hash f tabla2)) (tabla1 n)

foldrHSET :: (a -> a -> a) -> HashSet a -> a
foldrHSET f (Hash _ tabla) = case concatMap tabla [0 ..] of
  [] -> error "Empty HashSet"
  xs -> foldr1 f xs
