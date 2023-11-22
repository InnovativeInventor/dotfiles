import XMonad

import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Actions.FindEmptyWorkspace
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.CopyWindow(copy)
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch

-- import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Util.Ungrab

-- import XMonad.Hooks.StatusBar
-- import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = xmonad $ xmobarProp $ myConfig
  -- sb <- statusBarPipe "i3status" (pure def) -- (pure xmobarPP)
  -- xmonad $ withSB sb $ myConfig
  -- xmonad $ xmobarProp $ myConfig

myWorkspaces = ["1:class", "2:res", "3:code", "4:msg", "5:scratch", "6", "7", "8", "9"]

myConfig = def { terminal = "alacritty", workspaces = myWorkspaces } `additionalKeysP` myKeys `removeKeysP` ["M-p"]
myXPConfig = def { searchPredicate = fuzzyMatch, sorter = fuzzySort }

myKeys = [ ("M-a", spawn "xbacklight -dec 5 &>> /home/max/xmonad.log")
          , ("M-s", spawn "xbacklight -inc 5 &>> /home/max/xmonad.log")
          , ("M-d", spawn "dmenu_run &>> /home/max/xmonad.log")
          , ("M-f", spawn "xfce4-find-cursor")
          -- , ("M-e", tagToEmptyWorkspace)
          , ("M-e", viewEmptyWorkspace)
	  , ("M-n", addWorkspacePrompt myXPConfig)
	  , ("M-v", selectWorkspace myXPConfig)
          , ("M-<Esc>", spawn "xfce4-screensaver-command -l &>> /home/max/xmonad.log; bash /home/max/scripts/backup.sh &>> /home/max/xmonad.log")
  ]
