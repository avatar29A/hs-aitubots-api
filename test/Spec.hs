{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Main (main) where

import Data.Maybe
import Test.Hspec
import Options.Applicative
import           System.Environment           (lookupEnv, withArgs)

import qualified Data.ByteString as BS

-- Specs
import qualified MainSpec
import qualified JSONSpec

-- | Command line options for test suite
data Options = Options {
    opt_integration :: Bool   -- ^ Run integration tests
    , opt_botName   :: Maybe BS.ByteString   -- ^ Bot Name
    , opt_chatId    :: Maybe BS.ByteString   -- ^ Id of a chat or of your bot
    , opt_botToken  :: Maybe BS.ByteString   -- ^ Token
    , opt_hSpecOpts   :: Maybe [String] -- ^ Command line options to pass to hSpec
}

options :: Parser Options
options = Options
    <$> switch
        ( long "integration"
            <> help "Run integration tests" )
    <*> optional ( strOption
        ( long "username"
            <> short 'n'
            <> short 'u'
            <> metavar "BOT_USER_NAME"
            <> help "Bot username" ))
    <*> optional ( strOption
        ( long "chatid"
            <> short 'c'
            <> metavar "CHAT_ID"
            <> help "Chat Id" ))
    <*> optional ( strOption
        ( long "token"
            <> short 't'
            <> metavar "TOKEN"
            <> help "Token that you got from MasterService" ))
    <*> optional ( some ( argument str
        ( metavar "HSPEC_ARGS"
        <> help "Hspec arguments")))

main :: IO ()
main = do
    Options{..} <- execParser opts
    let 
        integration = opt_integration
        token = opt_botToken
        name = opt_botName
        chat = opt_chatId
        hspecArgs = fromMaybe [] opt_hSpecOpts
    withArgs hspecArgs $ hspec $ runSpec' integration name chat token 
    where
        opts = info (options <**> helper) ( fullDesc
            <> progDesc "Run integration tests for Aitu Bot API"
            <> header "\nHelp about integration test's arguments" )

runSpec' :: Bool -> Maybe BS.ByteString -> Maybe BS.ByteString -> Maybe BS.ByteString -> SpecWith ()
runSpec' True (Just botName) (Just chatid) (Just token) = describe "Main integration tests"
                                                                $ MainSpec.spec botName token chatid
runSpec' True _ _ _ = fail "Missing required arguments for integration tests. Run stack test --test-arguments \"--help\" for more info"
runSpec' _ _ _ _  = describe "Unit tests" JSONSpec.spec