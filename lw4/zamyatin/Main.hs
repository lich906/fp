import MyModule
import Data.Set as Set

main :: IO()
main = do
    print (myIntersect [1, 2, 3] []) -- []
    print (myIntersect [4, 5, 6] [5, 6, 7]) -- [5, 6]
    print (myIntersect [1, 2, 3] [4, 5, 6]) -- []

    print (myFilter (>5) [1,2,3,4,5,6,7,8]) -- [6, 7, 8]
    print (myFilter (\x -> length x > 4) ["aaaa","bbbbbbbbbbbbb","cc"]) -- ["bbbbbbbbbbbbb"]
    print (myFilter (== 1) []) -- []

    print (toList (myDifference (fromList [1, 2, 3, 4, 5]) (fromList [1, 2, 3]))) -- [4, 5]
    print (toList (myDifference (fromList [1, 2]) (fromList [1, 2, 3]))) -- []
    print (toList (myDifference (fromList [1]) (fromList []))) -- [1]

    print (myToUpper 'A') -- 'A'
    print (myToUpper 'z') -- 'Z'
    print (myToUpper '!') -- '!'

    print (myIsLetter 'b') -- True
    print (myIsLetter '~') -- False
    print (myIsLetter '1') -- False
