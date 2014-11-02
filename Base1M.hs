-- Module:      Base1M
-- Copyright:   (c) 2014
-- License:     Apache
-- Maintainer: Brian Sunter <public@briansunter.com>
-- This module converts between base 10 and base 1114015.

module Base1M 
(encodeBase1M
,decodeBase1M) where

import Data.List(elemIndex)
import Data.Maybe(fromJust)

unicodes = ['a'..]
numOfUnicodes = toInteger $ length unicodes

numToDigs :: Integer -> Integer -> [Integer]
numToDigs 0 _ = []
numToDigs x b = numToDigs (x `div` b) b ++ [x `mod` b]

digsToNum :: [Integer] -> Integer
digsToNum [] = 0
digsToNum (x:xs) = x * (numOfUnicodes ^ (length xs)) + digsToNum xs

numToUni :: Integer -> Char
numToUni x = unicodes !! fromInteger x 

uniToNum :: Char -> Integer
uniToNum x = toInteger $ fromJust $ elemIndex x unicodes

encodeBase1M :: Integer -> [Char]
encodeBase1M x = map numToUni $ numToDigs x numOfUnicodes

decodeBase1M :: [Char] -> Integer
decodeBase1M x = digsToNum $ map uniToNum x
