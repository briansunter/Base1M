## Base1M

Convert between base 10 and base 1114015

## Using
    import Base1M
    putStrLn $ encodeBase1M 47675435346 
    -- Ɥ셟
    putStrLn $ decodeBase1M "Ɥ셟"
    -- 47675435346 

## Performance-
Compiled with ghc 7.8.3 -O2 Main.hs && time ./Main
    
    0.11s user 0.03s system 93% cpu 0.148 total
