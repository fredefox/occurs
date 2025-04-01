module Main where

import qualified Data.Map.Strict as Map
import Data.Foldable (traverse_)
import Data.Text as Text
import Data.Text.IO as Text

main :: IO ()
main = Text.getContents >>= traverse_ p . occurs . Text.lines
  where
  p :: (Text, Int) -> IO ()
  p (s, n) = Text.putStrLn $ Text.unwords [Text.show n, s]

occurs :: Ord a => [] a -> [] (a, Int)
occurs = Map.toList . Map.fromListWith (+) . fmap (\x -> (x, 1))
