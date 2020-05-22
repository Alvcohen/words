import Lib
import Test.Hspec
main :: IO ()
main = hspec $ do
    describe "How do we write a test" $ do
        it "Should be able to run tests" $ do
            someString `shouldBe` "someString"
