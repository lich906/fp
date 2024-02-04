import MyModule
import Test.HUnit
import qualified Data.Set as Set

main :: IO ()
main = do
  _ <- runTestTT $ TestList [testMyIntersperse, testMyTranspose, testMyFromList, testMyPartition, testMyIntercalate]
  return ()

testMyIntersperse = TestLabel "Test myIntersperse" $ TestList
  [ "Empty list" ~: [] ~=? myIntersperse ',' []
  , "Single element" ~: ['a'] ~=? myIntersperse ',' ['a']
  , "List of strings" ~: ["hello", " ", "world", " ", "!"] ~=? myIntersperse " " ["hello", "world", "!"]
  , "Long list" ~: take 10 (myIntersperse 0 (replicate 10000 1)) ~=? take 10 (1 : concat (replicate 4999 [0,1]))
  ]

testMyTranspose = TestLabel "Test myTranspose" $ TestList
  [ "Empty list of lists" ~: [] ~=? myTranspose []
  , "List of empty lists" ~: [] ~=? myTranspose [[], [], []]
  , "List of lists of different lengths" ~: [[1,4,6], [2,5], [3]] ~=? myTranspose [[1,2,3], [4,5], [6]]
  , "List of strings" ~: ["adf", "be", "c"] ~=? myTranspose ["abc", "de", "f"]
  ]

testMyFromList = TestLabel "Test myFromList" $ TestList
  [ "Empty list" ~: Set.empty ~=? myFromList []
  , "List with duplicates" ~: Set.fromList [1,2,3,4,5] ~=? myFromList [1,2,2,3,4,4,4,5]
  , "List of strings with duplicates" ~: Set.fromList ["apple", "banana", "orange"] ~=? myFromList ["apple", "orange", "banana", "apple"]
  ]

testMyPartition = TestLabel "Test myPartition" $ TestList
  [ "Empty list" ~: ([], []) ~=? myPartition even []
  , "All elements satisfy the predicate" ~: ([1,2,3,4,5], []) ~=? myPartition (>0) [1,2,3,4,5]
  , "Mixed list" ~: ([2,4], [1,3,5]) ~=? myPartition even [1,2,3,4,5]
  ]

testMyIntercalate = TestLabel "Test myIntercalate" $ TestList
  [ "Empty list of lists" ~: [] ~=? myIntercalate "," []
  , "Single sublist" ~: ["hello"] ~=? myIntercalate "," ["hello"]
  , "List of strings as sublists" ~: "hello world !" ~=? concat (myIntercalate " " ["hello", "world", "!"])
  ]

