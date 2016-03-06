--
-- Integrate these utilities into Threepenny-GUI!
--
module Utils(startGUI, space, getValueBehavior, unions) where

import qualified Graphics.UI.Threepenny      as UI
import           Graphics.UI.Threepenny.Core hiding (startGUI, unions)


startGUI config f = UI.startGUI config $ \w -> f w >> return ()

space = "\8200"

getValueBehavior :: Element -> UI (Behavior String)
getValueBehavior el = do
    a <- el # get UI.value
    stepper a $ UI.valueChange el

unions :: [Event (a -> a)] -> Event (a -> a)
unions = foldr (unionWith (.)) never

{- FFI improvements

To get flicker-free animation, it pays off / is necessary to
merge canvas manipulation functions into a single message.

-}
