{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

import qualified Language.C.Inline as C

C.include "<stdio.h>"

main :: IO ()
main = do
  x <- [C.block| int {
      // Read and sum 5 integers
      int i, sum = 0, tmp;
      for (i = 0; i < 5; i++) {
        scanf("%d", &tmp);
        sum += tmp;
      }
      return sum;
    } |]
  print x