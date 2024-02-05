module Main where

import MyModule
import Test.HUnit
import qualified Data.Set as Set

main :: IO ()
main = do
  _ <- runTestTT $ TestList [testMyIntersperse, testMyTranspose, testMyFromList, testMyPartition, testMyIntercalate]
  return ()

testMyIntersperse = TestLabel "Test myIntersperse" $ TestList
  [ "Empty list" ~: [] ~=? myIntersperse ',' ([] :: [Char])
  , "Single element" ~: "a" ~=? myIntersperse ',' "a"
  , "Multiple elements" ~: "a,b,c" ~=? myIntersperse ',' "abc"
  , "With spaces" ~: "h,e,l,l,o, ,w,o,r,l,d" ~=? myIntersperse ',' "hello world"
  , "Numerical list" ~: [1,0,2,0,3] ~=? myIntersperse 0 [1,2,3]
  ]

testMyTranspose = TestLabel "Test myTranspose" $ TestList
  [ "Single list" ~: [[1],[2],[3]] ~=? myTranspose [[1,2,3]]
  , "Rectangle matrix" ~: [[1,3],[2,4]] ~=? myTranspose [[1,2],[3,4]]
  , "Irregular matrix" ~: [[1,3,5],[2,4]] ~=? myTranspose [[1,2],[3,4],[5]]
  , "All empty sublists" ~: ([] :: [[Int]]) ~=? myTranspose (replicate 5 ([] :: [Int]))
  , "One empty sublist" ~: [[1],[2],[3]] ~=? myTranspose ([[] :: [Int], [1,2,3]])
  ]


testMyFromList = TestLabel "Test myFromList" $ TestList
  [ "Integer list with duplicates" ~: Set.fromList [1,2,3] ~=? myFromList [1,2,2,3,3,3]
  , "String list with duplicates" ~: Set.fromList ["apple", "orange"] ~=? myFromList ["apple", "orange", "apple"]
  , "Empty list" ~: Set.empty ~=? myFromList ([] :: [Int])
  , "List with negative and positive integers" ~: Set.fromList [-2, -1, 0, 1, 2] ~=? myFromList [1, -1, 2, -2, 0]
  , "Single element list" ~: Set.fromList ["single"] ~=? myFromList ["single"]
  ]

testMyPartition = TestLabel "Test myPartition" $ TestList
  [ "All true" ~: ([1,2,3], []) ~=? myPartition (>0) [1,2,3]
  , "All false" ~: ([], [1,2,3]) ~=? myPartition (<0) [1,2,3]
  , "Mixed" ~: ([2,4], [1,3]) ~=? myPartition even [1,2,3,4]
  , "Empty list" ~: ([], []) ~=? myPartition (const True) ([] :: [Int])
  , "With zero" ~: ([0,2], [-1,-2]) ~=? myPartition (>=0) [-1,0,2,-2]
  ]

testMyIntercalate = TestLabel "Test myIntercalate" $ TestList
  [ "Empty sublists" ~: ",," ~=? myIntercalate "," ["", "", ""]
  , "Single element sublists" ~: "a,b,c" ~=? myIntercalate "," ["a", "b", "c"]
  , "Mixed sublists" ~: "abc,def,ghi" ~=? myIntercalate "," ["abc", "def", "ghi"]
  , "Intersperse lists" ~: "1,2,3" ~=? myIntercalate "," ["1", "2", "3"]
  ]
