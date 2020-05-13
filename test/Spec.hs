module Main (main) where

import Data.Maybe
import Test.Hspec
import Options.Applicative

-- Specs
import qualified JSONSpec

-- | Command line options for test suite
data Options = Options {
    opt_integration :: Bool   -- ^ Run integration tests
    , opt_chatId    :: Maybe String   -- ^ Id of a chat or of your bot
    , opt_botToken  :: Maybe String   -- ^ Bot name
}

options :: Parser Options
options = Options
    <$> switch
        ( long "integration"
            <> help "Run integration tests" )
    <*> optional ( strOption
        ( long "chatid"
            <> short 'c'
            <> metavar "CHAT_ID"
            <> help "Chat Id" ))
    <*> optional ( strOption
        ( long "token"
            <> short 't'
            <> metavar "TOKEN"
            <> help "Bot Name" ))

main :: IO ()
main = runSpec' =<< execParser opts
    where
        opts = info (options <**> helper) ( fullDesc
            <> progDesc "Run integration tests for Aitu Bot API"
            <> header "\nHelps about integration test's arguments" )

runSpec' :: Options -> IO ()
runSpec' (Options True chatid token) = putStrLn $ "ChatID: " <> fromMaybe "" chatid <> " Token: " <> fromMaybe "" token
runSpec' _ = hspec JSONSpec.spec
