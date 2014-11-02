-- Copyright:   (c) 2014
-- License:     Apache
-- Maintainer: Brian Sunter <public@briansunter.com>
-- This program converts the first 100 digits of pi to a base 1114015 (~1.1 Million)
-- Represented in unicode.
-- For Example: The number below converts to ʏ񚤼𦀇𵈯󹳧􏫊񃯵񚋋񖐾󾑫񒹘򵡼񕩚𾘟􉍌 
--
--Compiled with ghc 7.8.3 -O2 Main.hs && time ./Main
--Results in 0.11s user 0.03s system 93% cpu 0.148 total

import Base1M
main = print $ encodeBase1M 3141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067

