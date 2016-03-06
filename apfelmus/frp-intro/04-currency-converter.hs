{-# LANGUAGE ScopedTypeVariables #-}

import Data.Maybe
import Text.Printf
import Safe          (readMay)

import qualified Graphics.UI.Threepenny      as UI
import           Graphics.UI.Threepenny.Core hiding (startGUI, unions)

import Utils

{-----------------------------------------------------------------------------

------------------------------------------------------------------------------}
config = defaultConfig
    { jsStatic = Just "."
    , jsPort   = Just 8004 }

main = startGUI config $ \window -> do
    -- GUI elements and layout
    UI.addStyleSheet window "examples.css"

    dollar <- UI.input
    euro   <- UI.input

    elWrap   <- UI.div # set UI.id_ "outer"
    getBody window #+ [element elWrap]
    
    element elWrap #+ [
            column [
                grid [[string "Dollar:", element dollar]
                     ,[string "Euro:"  , element euro  ]]
            , string "Amounts update while typing."
            ]]


    -- FRP logic
    euroIn   <- stepper "0" $ UI.valueChange euro
    dollarIn <- stepper "0" $ UI.valueChange dollar
    let
        rate = 0.7 :: Double
        withString f = maybe "-" (printf "%.2f")
				     . fmap f . readMay
    
        dollarOut = withString (/ rate) <$> euroIn
        euroOut   = withString (* rate) <$> dollarIn

    -- connect logic back to GUI
    element euro   # sink value euroOut
    element dollar # sink value dollarOut






