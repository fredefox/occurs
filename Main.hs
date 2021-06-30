module Main where

import qualified Data.Map as Map
import Data.Foldable (traverse_)

main :: IO ()
main = getContents >>= traverse_ p . occurs . lines
  where
  p :: (String, Int) -> IO ()
  p (s, n) = putStrLn $ show n <> " " <>s

occurs :: Ord a => [] a -> [] (a, Int)
occurs = Map.toList . Map.fromListWith (+) . fmap (\x -> (x, 1))
