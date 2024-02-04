import MyModule (myIntersperse, myTranspose, myFromList, myPartition, myIntercalate)

main :: IO ()
main = do
  -- Тесты для intersperse
  print $ myIntersperse ',' "hello"
  print $ myIntersperse 0 [1,2,3,4]

  -- Тесты для transpose
  print $ myTranspose [[1,2,3],[4,5,6],[7,8,9]]
  print $ myTranspose ["hey","there","guys"]

  -- Тесты для fromList
  print $ myFromList [5,3,8,2]
  print $ myFromList "haskell"

  -- Тесты для partition
  print $ myPartition even [1,2,3,4,5,6]
  print $ myPartition (>0) [-5,0,5]

  -- Тесты для intercalate
  print $ myIntercalate " " ["hey","there","guys"]
  print $ myIntercalate [0] [[1,2,3],[4,5,6],[7,8,9]]
