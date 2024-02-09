import System.Environment

data Args = Args {
    inFile :: String,
    outFile :: String
} deriving (Show)

parseArgs :: String -> [String] -> Maybe Args
parseArgs progName args
    | length args /= 2 = Nothing
    | otherwise = Just $ Args (head args) (last args)

main :: IO ()
main = do
    rawArgs <- getArgs
    progName <- getProgName
    let maybeArgs = parseArgs progName rawArgs
    case maybeArgs of
        Nothing -> error "Invalid arguments.\n"
        Just args -> do
            print $ inFile args
            print $ outFile args    
