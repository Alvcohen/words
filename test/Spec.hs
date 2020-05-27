import Lib
import Data
import Test.Hspec
main :: IO ()
main = hspec $ do
    describe "formatGrid" $ do
        it "Should concat every line with a new line" $ do
           (formatGrid ["qwe", "asd", "qaz", "zaq"]) `shouldBe` "qwe\nasd\nqaz\nzaq\n"

    describe "findWord" $ do
        it "Should find words that exist on a grid" $ do
            findWord grid "HASKELL" `shouldBe` Just "HASKELL"
            findWord grid "PERL" `shouldBe` Just "PERL"
            findWord grid "HAMSTER" `shouldBe` Nothing

    describe "findWords" $ do
        it "Should find all the words" $ do
            findWords grid languages `shouldBe` languages
        it "Should not find missing words" $ do
            findWords grid ["qwe", "qas"] `shouldBe` []