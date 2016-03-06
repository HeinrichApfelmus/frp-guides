{-----------------------------------------------------------------------------
    "Functional Reactive Programming"
    Heinrich Apfelmus
    bobkonf 2016

    Example
        Animation with Behavior

------------------------------------------------------------------------------}
import           Data.List                          (intercalate)
import qualified Graphics.UI.Threepenny      as UI
import           Graphics.UI.Threepenny.Core hiding (startGUI, Behavior)

import Utils

{-----------------------------------------------------------------------------
    Behavior
------------------------------------------------------------------------------}
type Time       = Double
type Behavior a = Time -> a

-- bob of a pendulum
bob :: Behavior UI.Point
bob = \time ->
    let angle = 30 * pi/180 * sin (1.5*time)
        x     = x0 + len * sin angle
        y     = y0 + len * cos angle
    in  (x,y)

animate :: Behavior UI.Point -> IO ()

main = animate bob

-- various lengths
len, x0, y0 :: Double
len = 180
x0  = 200
y0  = 100

{-----------------------------------------------------------------------------
    GUI code
------------------------------------------------------------------------------}
config = defaultConfig
    { jsStatic = Just "."
    , jsPort   = Just 8001 }

animate behavior = startGUI config $ \window -> do
    -- UI elements and layout
    UI.addStyleSheet window "examples.css"

    canvas <- UI.canvas
        # set UI.width  400
        # set UI.height 400
        # set UI.fillStyle (UI.solidColor $ UI.RGB 0 0 200)
        -- # set UI.style [("border","solid black 1px")]

    getBody window #+ [element canvas]

    -- drawing
    let
        draw :: UI.Point -> UI ()
        draw (x,y) = runFunction $ ffi drawCode canvas x0 y0 x y

    -- animation
    let fps = 60
    timer <- UI.timer

    eTime <- accumE 0 $ (+ 1 / fps) <$ UI.tick timer
    onEvent eTime $ \time -> do
        canvas # UI.clearCanvas
        draw (behavior time) 

    return timer
        # set UI.interval (floor $ 1000 / fps)
        # set UI.running  True

drawCode = intercalate ";"
    [ "var c=%1.getContext('2d'), x0=%2, y0=%3, x=%4, y=%5"
    -- pendulum arm
    , "c.beginPath()"
    , "c.moveTo(x0-10,y0)"
    , "c.lineTo(x-10,y)"
    , "c.lineTo(x+10,y)"
    , "c.lineTo(x0+10,y0)"
    , "c.fill()"
    -- bob
    , "c.beginPath()"
    , "c.arc(x,y,20,0,360)"
    , "c.fill()"
    ]
    


