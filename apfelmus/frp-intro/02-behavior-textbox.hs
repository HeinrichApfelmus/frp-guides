{-----------------------------------------------------------------------------
    "Functional Reactive Programming"
    Heinrich Apfelmus
    bobkonf 2016

    Example
        Applying a function to a Behavior

------------------------------------------------------------------------------}
{-# LANGUAGE ScopedTypeVariables #-}

import qualified Graphics.UI.Threepenny      as UI
import           Graphics.UI.Threepenny.Core hiding (startGUI)

import Utils

{-----------------------------------------------------------------------------

------------------------------------------------------------------------------}
config = defaultConfig
    { jsStatic = Just "."
    , jsPort   = Just 8002 }

main = startGUI config $ \window -> do
    -- GUI elements and layout
    UI.addStyleSheet window "examples.css"

    elInput  <- UI.input
    elOutput <- UI.span

    elWrap   <- UI.div # set UI.id_ "outer"
    getBody window #+ [element elWrap]
    
    let code s = string s # set UI.class_ "code"
    element elWrap #+
            [ code "fmap reverse \""
            , element elInput
            , code ("\" = \"")
            , element elOutput
            , code "\""
            ]


    -- FRP logic
    (input :: Behavior String) <- getValueBehavior elInput
    let
        output :: Behavior String
        output = fmap reverse input


    -- connect logic back to GUI
    element elOutput # sink UI.text output




