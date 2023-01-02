import XMonad

import XMonad.Util.EZConfig
-- import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Util.Ungrab

-- import XMonad.Hooks.StatusBar
-- import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = do
  -- sb <- statusBarPipe "i3status" (pure def) -- (pure xmobarPP)
  -- xmonad $ withSB sb $ myConfig
  xmonad $ myConfig

myConfig = def { terminal = "alacritty" } `additionalKeysP` myKeys `removeKeysP` ["M-p"]

myKeys = [ ("M-e", spawn "xbacklight -dec 5 &>> /home/max/xmonad.log")
          , ("M-r", spawn "xbacklight -inc 5 &>> /home/max/xmonad.log")
          , ("M-d", spawn "dmenu_run &>> /home/max/xmonad.log")
  ]
