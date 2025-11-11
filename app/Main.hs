module Main where

import System.Environment (getArgs)
import Parser (parseRuby)
import Evaluator (evalRuby)
import Builtins (initEnv)

main :: IO ()
main = do
  args <- getArgs
  code <- case args of
    [file] -> readFile file
    _ -> return "puts (1 + 2)"
  let ast = parseRuby code
  env <- initEnv
  evalRuby env ast
