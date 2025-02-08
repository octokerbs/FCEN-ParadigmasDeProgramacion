sum :: (Num a) => [a] -> a
sum = foldr (+) 0

elem2 :: (Eq a) => [a] -> a -> Bool
elem2 xs e = foldr (\x rec -> x == e || rec) False xs

(++) :: [a] -> [a] -> [a]
(++) xs ys = foldr (:) ys xs

filter2 :: (a -> Bool) -> [a] -> [a]
filter2 f = foldr (\x rec -> if f x then x : rec else rec) []

map2 :: (a -> b) -> [a] -> [b]
map2 = map

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f = foldr1 (\x rec -> if f x rec then x else rec)

sumasParciales :: (Num a) => [a] -> [a]
sumasParciales = foldl (\ac x -> if null ac then [x] else ac ++ [last ac + x]) []

sumaAlt :: (Num a) => [a] -> a
sumaAlt = foldr (-) 0

sumaAlt2 :: (Num a) => [a] -> a
sumaAlt2 = foldl1 (flip (-))