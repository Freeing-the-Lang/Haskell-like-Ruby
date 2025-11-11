module Parser (parseRuby) where
import Text.ParserCombinators.ReadP

data Expr
  = IntLit Int
  | Add Expr Expr
  | Call String [Expr]
  deriving (Show)

parseRuby :: String -> Expr
parseRuby src =
  case readP_to_S expr src of
    [(e, "")] -> e
    _ -> error "Parse error"
  where
    intLit = IntLit . read <$> munch1 (`elem` ['0'..'9'])
    addExpr = chainl1 term (Add <$ skipSpaces *> char '+' *> skipSpaces)
    term = intLit
    expr = addExpr
