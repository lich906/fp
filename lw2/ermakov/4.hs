position :: Eq a => [a] -> a -> Int
position list element = positionHelper list element 0
  where
    positionHelper [] _ _ = -1
    positionHelper (x:xs) element index
      | x == element = index
      | otherwise = positionHelper xs element (index + 1)

main :: IO ()
main = do
    let list = [5, 3, 42, 7, 3]
    print $ position list 42  -- Выведет 2, так как 42 находится на индексе 2
    print $ position list 1   -- Выведет -1, так как 1 нет в списке