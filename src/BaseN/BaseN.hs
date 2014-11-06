-- Module:      BaseN
-- Copyright:   (c)2014
-- License:     Apache
-- Maintainer: Brian Sunter <public@briansunter.com>
-- This module converts between base 10 and base 1114015.

module BaseN 
(BaseN) where
import Data.List(elemIndex,all,genericLength)
import Data.Maybe(fromJust,isJust)

base10CharSet = ['0'..'9']

data BaseN = BaseN [Char] Integer deriving(Show)
instance Num BaseN where
  (BaseN c x) + (BaseN c' y)  = (BaseN c (x + y)) 
  (BaseN c x) * (BaseN c' y)  = (BaseN c (x * y)) 
  abs (BaseN c x)  = BaseN c (abs x)
  signum (BaseN c x) = BaseN c (signum x)
  fromInteger i  =  BaseN base10CharSet i 
  negate (BaseN c x) = BaseN c (negate x) 

readBaseN :: [Char] -> [Char] -> (Maybe Integer)
readBaseN c x = 
    let nums = [elemIndex y c | y <- x ] 
     in if all isJust nums then Just (toInteger $ foldl (\acc x -> acc + 2 * fromJust x) 0   nums)  else Nothing  

encodeBaseN :: [Char] -> Int-> [Char]
encodeBaseN c i 
  | i < clen = [c !! i] 
  | otherwise =  encodeBaseN c nextIndex  ++ [(c !! index)]
  where clen  = (length c)
        index = (mod i clen)
        nextIndex = (div (i - index) clen)

