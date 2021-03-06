module Main where

--Libraries needed
import Text.Regex.TDFA
import qualified Data.ByteString.Char8 as S
import System.Environment (getArgs)
import Data.Time

--This function recieves two parameters of type strict bytestring and returns a boolean.
--It determines whether the regular expression matches the strict bytestring contained in the text file using the regex tdfa library.
matchRegEx:: S.ByteString ->  S.ByteString -> Bool
matchRegEx x y =  y =~ x :: Bool

--Auxiliary function which recieves a boolean and writes it as a string
boolToString :: Bool -> String
boolToString True  = "True"
boolToString False = "False"

--Auxiliary function which recieves a boolean and return a string chain of the format required.
printaux ::  Bool -> String
printaux a = "Result: " ++ boolToString a

--The main function which reads from the command the arguments, text file name and the regular expression, reads the text file and prints the expected output.
main :: IO ()
main = do 
    start <- getCurrentTime
    file  <- getArgs
    input <- readFile (head(file))
    let source   = S.pack (last(file))
    let inputaux = S.pack input
    let match    = matchRegEx source inputaux
    print (printaux match)
    stop <- getCurrentTime
    print "Time: "
    print $ diffUTCTime stop start
