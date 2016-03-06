{-----------------------------------------------------------------------------
    "Functional Reactive Programming"
    Heinrich Apfelmus
    bobkonf 2016

    Example
        Counter

------------------------------------------------------------------------------}
{-# LANGUAGE ScopedTypeVariables #-}

import qualified Graphics.UI.Threepenny      as UI
import           Graphics.UI.Threepenny.Core hiding (startGUI, unions)

import Utils

{-----------------------------------------------------------------------------

------------------------------------------------------------------------------}
config = defaultConfig
    { jsStatic = Just "."
    , jsPort   = Just 8003 }

main = startGUI config $ \window -> do
    -- GUI elements and layout
    UI.addStyleSheet window "examples.css"

    up       <- UI.button # set UI.text "Up"
    down     <- UI.button # set UI.text "Down"
    elOutput <- UI.span

    elWrap   <- UI.div # set UI.id_ "outer"
    getBody window #+ [element elWrap]

    element elWrap #+
        [ element up, element down
        , string (space ++ "Count =" ++ space)
        , element elOutput
        ]
    let click = UI.click


    -- FRP logic
    (counter :: Behavior Int) <- accumB 0 $ unionWith (.)
        ((\c -> c + 1) <$ click up  )
        ((\c -> c - 1) <$ click down)

    -- connect logic back to GUI
    element elOutput # sink UI.text (show <$> counter)




