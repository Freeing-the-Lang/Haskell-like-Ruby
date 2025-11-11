module Evaluator (evalRuby) where
import qualified Data.Map as M
import Environment

evalRuby :: Env -> Expr -> IO ()
evalRuby env (IntLit n) = print n
evalRuby env (Add a b) = do
  let IntLit x = a
  let IntLit y = b
  print (x + y)
evalRuby env (Call "puts" [x]) = putStrLn (show x)
evalRuby _ _ = putStrLn "⚠️ Unimplemented expression"
