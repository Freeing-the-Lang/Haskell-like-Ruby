module Builtins (initEnv) where
import Environment
import qualified Data.Map as M

-- 간단한 초기 환경 (Ruby의 기본 함수처럼)
initEnv :: IO Env
initEnv = do
  putStrLn "Initializing Haskell-like-Ruby environment..."
  return M.empty
