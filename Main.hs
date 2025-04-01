{-# language GHC2024, Strict #-}
{-# options_ghc -Wall #-}
module Main where

import qualified Data.Map.Strict as Map
import Data.Foldable (traverse_)
import Data.Text as Text
import Data.Text.IO as Text
import Data.Char
import Data.Semigroup
import System.Environment (getArgs)

newtype Occurs a = Occurs (Sum Int, Last a)

-- I broke the nice performance characteristic of my program when I
-- rewrote it to use this inherited newtype instance.  It's not
-- sufficiently strict.  Which sucks because it prevents us from
-- simply using this instance:
-- deriving newtype instance Semigroup (Occurs a)
instance Semigroup (Occurs a) where
  Occurs (Sum !n, _) <> Occurs (Sum !m, !a) = Occurs (Sum (n + m), a)

main :: IO ()
main = do
  p <- getArgs >>= \case
    ("--signature":_) -> pure sgntr
    _ -> pure id
  mainWith p

mainWith :: (Text -> Text) -> IO ()
mainWith q = Text.getContents >>= traverse_ p . occurs q . Text.lines
  where
  p :: (Text, Occurs Text) -> IO ()
  p (_, Occurs (Sum n, Last s)) = Text.putStrLn $ Text.unwords [Text.show n, s]

occurs :: Semigroup a => Ord b => Monoid b => (a -> b) -> [] a -> [] (b, Occurs a)
occurs p = Map.toList . Map.fromListWith (<>) . fmap (\x -> (p x, (Occurs (Sum 1, Last x))))

sgntr :: Text -> Text
sgntr = Text.filter (not . isAlphaNum)
