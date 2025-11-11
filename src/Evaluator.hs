module Evaluator (evalRuby) where
import qualified Data.Map as M
import Environment
import Parser

evalRuby :: Env -> Expr -> IO ()
evalRuby _ (IntLit n) = print n
evalRuby env (Add a b) = do
  evalRuby env a
  evalRuby env b
evalRuby _ (Call "puts" [x]) = putStrLn (show x)
evalRuby _ e = putStrLn $ "⚠️ Unimplemented: " ++ show e
