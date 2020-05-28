import Lib
import Data
import Test.Hspec


gwc = gridWithCoords grid

testfindWord word =
    let (Just result) = findWord gwc word
        string = map cell2char result
    in string `shouldBe` word


main :: IO ()
main = hspec $ do
    describe "formatGrid" $ do
        it "Should concat every line with a new line" $ do
           (formatGrid  (gridWithCoords ["qwe", "asd", "qaz", "zaq"])) `shouldBe` "qwe\nasd\nqaz\nzaq\n"

    describe "findWord" $ do
        it "Should find words that exist on a grid" $ do
            testfindWord  "HASKELL"
            testfindWord  "PERL"

    describe "findWords" $ do
        it "Should find all the words" $ do
            let found = findWords gwc languages
                asString = map (map cell2char) found
            asString `shouldBe` languages
        it "Should not find missing words" $ do
            findWords gwc   ["qwe", "qas"] `shouldBe` []