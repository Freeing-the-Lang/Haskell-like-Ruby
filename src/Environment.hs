module Environment where
import qualified Data.Map as M

type Env = M.Map String String
emptyEnv :: IO Env
emptyEnv = return M.empty
