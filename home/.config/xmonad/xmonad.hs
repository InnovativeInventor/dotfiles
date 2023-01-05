import XMonad

import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

-- import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Util.Ungrab

-- import XMonad.Hooks.StatusBar
-- import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = do
  -- sb <- statusBarPipe "i3status" (pure def) -- (pure xmobarPP)
  -- xmonad $ withSB sb $ myConfig
    xmonad $ xmobarProp $ myConfig

myConfig = def { terminal = "alacritty" } `additionalKeysP` myKeys `removeKeysP` ["M-p"]

myKeys = [ ("M-a", spawn "xbacklight -dec 5 &>> /home/max/xmonad.log")
          , ("M-s", spawn "xbacklight -inc 5 &>> /home/max/xmonad.log")
          , ("M-d", spawn "dmenu_run &>> /home/max/xmonad.log")
          , ("M-<Esc>", spawn "xfce4-screensaver-command -l &>> /home/max/xmonad.log")
  ]
