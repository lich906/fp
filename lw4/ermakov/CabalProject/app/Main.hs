module Main where

import MyModule
import Test.HUnit
import qualified Data.Set as Set
import qualified Data.List as List

main :: IO ()
main = do
  _ <- runTestTT $ TestList [testMyIntersperse, testMyTranspose, testMyFromList, testMyPartition, testMyIntercalate, testIsHexDigit, testMember]
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

testIsHexDigit = TestLabel "Test isHexDigit" $ TestList
  [ "Digit 1" ~: True ~=? myIsHexDigit '1'
  , "Digit a" ~: True ~=? myIsHexDigit 'a'
  , "Digit A" ~: True ~=? myIsHexDigit 'A'
  , "Non-digit G" ~: False ~=? myIsHexDigit 'G'
  , "Non-digit g" ~: False ~=? myIsHexDigit 'g'
  , "Digit 9" ~: True ~=? myIsHexDigit '9'
  , "Digit f" ~: True ~=? myIsHexDigit 'f'
  , "Digit F" ~: True ~=? myIsHexDigit 'F'
  , "Non-digit @" ~: False ~=? myIsHexDigit '@'
  , "Non-digit `" ~: False ~=? myIsHexDigit '`'
  ]

testMember = TestList
  [
    "Empty map" ~: False ~=? myMember 1 Empty,
    "Single node, present" ~: True ~=? myMember 1 (Node 1 "one" Empty Empty),
    "Single node, absent" ~: False ~=? myMember 2 (Node 1 "one" Empty Empty),
    "Left heavy, present" ~: True ~=? myMember 1 (Node 2 "two" (Node 1 "one" Empty Empty) Empty),
    "Balanced, absent" ~: False ~=? myMember 4 (Node 2 "two" (Node 1 "one" Empty Empty) (Node 3 "three" Empty Empty))
  ]