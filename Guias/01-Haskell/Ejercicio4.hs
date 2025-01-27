permutaciones :: [a] -> [[a]]
permutaciones =
  foldr
    (\x rec -> concatMap (\xs -> map (f x xs) [0 .. length xs]) rec)
    [[]]
  where
    f x xs index = drop index xs ++ [x] ++ take index xs

partes :: [a] -> [[a]]
partes = foldr (\x rec -> rec ++ map (x :) rec) [[]]

prefijos :: [a] -> [[a]]
prefijos = foldl (\ac x -> ac ++ [last ac ++ [x]]) [[]]