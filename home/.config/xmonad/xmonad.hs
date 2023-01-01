import XMonad

import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

main :: IO ()
main = xmonad $ def { terminal = "alacritty" } `additionalKeysP` myKeys `removeKeysP` ["M-p"]

myKeys = [ ("M-e", spawn "xbacklight -dec 5 &>> /home/max/xmonad.log")
          , ("M-r", spawn "xbacklight -inc 5 &>> /home/max/xmonad.log")
          , ("M-d", spawn "dmenu_run &>> /home/max/xmonad.log")
  ]
