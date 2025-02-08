entrelazar :: [a] -> [a] -> [a]
entrelazar = foldr f (const [])
  where
    f x acc yys = if null yys then x : acc [] else x : head yys : acc (tail yys)
