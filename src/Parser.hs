module Parser (Expr(..), parseRuby) where
import Text.ParserCombinators.ReadP
import Control.Applicative ((<|>))

data Expr
  = IntLit Int
  | Add Expr Expr
  | Call String [Expr]
  deriving (Show)

parseRuby :: String -> Expr
parseRuby src =
  case readP_to_S (skipSpaces *> expr <* skipSpaces <* eof) src of
    [(e, "")] -> e
    _ -> error "Parse error"
  where
    intLit = IntLit . read <$> munch1 (`elem` ['0'..'9'])
    parens p = between (char '(' >> skipSpaces) (skipSpaces >> char ')') p
    term = intLit <|> parens expr
    addOp = do
      skipSpaces
      _ <- char '+'
      skipSpaces
      return Add
    expr = chainl1 term addOp
