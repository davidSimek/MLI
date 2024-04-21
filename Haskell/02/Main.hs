module Main where

import System.IO (hFlush, stdout)
import System.Random

mapDig :: Int -> String
mapDig 1 = "\
    \  #  \n\
    \ ##  \n\
    \# #  \n\
    \  #  \n\
    \#####"
mapDig 2 = "\
    \ ### \n\
    \#   #\n\
    \  #  \n\
    \ #   \n\
    \#####"
mapDig 3 = "\
    \ ### \n\
    \#   #\n\
    \   # \n\
    \#   #\n\
    \ ### "
mapDig 4 = "\
    \   # \n\
    \  ## \n\
    \ # # \n\
    \#####\n\
    \   # "
mapDig 5 = "\
    \#####\n\
    \#    \n\
    \#### \n\
    \    #\n\
    \#### "
mapDig 6 = "\
    \  #  \n\
    \ #   \n\
    \#### \n\
    \#   #\n\
    \ ### "
mapDig _ = "what?"


drawInt :: Int -> Int -> IO Int
drawInt x y = getStdRandom (randomR (x,y))

printRandom :: IO ()
printRandom = do
    randomDigit <- drawInt 1 6
    putStrLn $ "Your number is: \n" ++ mapDig randomDigit

ask :: IO ()
ask = do
    putStr "Do you want to generate a random number? (y/n): "
    hFlush stdout
    answer <- getLine

    if (head answer) == 'y' then do
        printRandom
        ask
    else if (head answer) /= 'n' then do
        ask
    else do
        putStrLn ""

main :: IO ()
main = ask
