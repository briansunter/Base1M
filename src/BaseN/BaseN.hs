-- Module:      BaseN
-- Copyright:   (c)2014
-- License:     Apache
-- Maintainer: Brian Sunter <public@briansunter.com>
-- This module converts between base 10 and base 1114015.

module BaseN 
(BaseN) where

import Data.List(elemIndex)
import Data.Maybe(fromJust)

base10CharSet = ['0'..'9']

data BaseN = BaseN [Char] [Char] deriving(Show)
instance Num BaseN where
  (BaseN c x) + (BaseN c' y)  = BaseN c $ encodeBase c $ ((decodeBase c x) + (decodeBase c' y))
  (BaseN c x) * (BaseN c' y)  = BaseN c $ encodeBase c $ ((decodeBase c x) * (decodeBase c' y))
  abs (BaseN c x)  = BaseN c $ encodeBase c $ abs $ (decodeBase c x) 
  signum (BaseN c x) = BaseN c $ encodeBase c $  signum $ decodeBase c x
  fromInteger i  =  BaseN base10CharSet $ encodeBase base10CharSet i 
  negate (BaseN c x) = BaseN c $ encodeBase c $ negate $ decodeBase c x

numToDigs :: Integer -> Integer -> [Integer]
numToDigs 0 _ = []
numToDigs b x = numToDigs (x `div` b) b ++ [x `mod` b]

digsToNum :: Integer -> [Integer] -> Integer
digsToNum _ [] = 0
digsToNum b (x:xs) = x * (b ^ (length xs)) + digsToNum b xs

numToUni :: [Char] -> Integer -> Char
numToUni charSet x = charSet !! fromInteger x 

uniToNum :: [Char] -> Char -> Integer
uniToNum charSet x = toInteger $ fromJust $ elemIndex x charSet 

encodeBase ::  [Char] -> Integer -> [Char]
encodeBase charSet x = map (\ y -> numToUni charSet y) $ numToDigs (toInteger $ length charSet) x 

decodeBase :: [Char] -> [Char] -> Integer
decodeBase charSet x = digsToNum  (toInteger $ length charSet) ( map (\ y -> uniToNum charSet y) x)
