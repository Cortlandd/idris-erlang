module Main

import ErlPrelude

testFiles : EIO ()
testFiles = do putStrLn "testFiles"
               h <- openFile "test_file" Read
               putStrLn $ "read char from file: " ++ singleton !(fgetc h)
               putStrLn $ "read from file: " ++ !(fread h)
               if !(feof h) then putStrLn "EOF" else putStrLn "Not EOF"
               closeFile h
               h' <- openFile "other_file" Write
               fwrite h' "test"
               closeFile h'

-- testProcesses : IO ()
-- testProcesses = do putStrLn "testProcesses"
--                    h <- popen "echo 'foo'" Read
--                    putStrLn $ "read from echo: " ++ !(fread h)
--                    pclose h


testStrings : EIO ()
testStrings = do putStrLn "testStrings"
                 s <- return ""
                 if !(nullStr s) then putStrLn "null" else putStrLn "not null"


main : EIO ()
main = do testFiles
          -- testProcesses
          testStrings
