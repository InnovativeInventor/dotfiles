import XMonad

import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Actions.FindEmptyWorkspace
-- import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.DynamicWorkspaceGroups
import XMonad.Actions.CopyWindow(copy)
import XMonad.Actions.EasyMotion (selectWindow)
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch

import Data.Tree
import XMonad.Actions.TreeSelect
import XMonad.Hooks.WorkspaceHistory
import qualified XMonad.StackSet as W

-- import Graphics.X11.ExtraTypes.XF86
-- import XMonad.Util.Ungrab

-- import XMonad.Hooks.StatusBar
-- import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = xmonad $ xmobarProp $ myConfig
  -- sb <- statusBarPipe "i3status" (pure def) -- (pure xmobarPP)
  -- xmonad $ withSB sb $ myConfig
  -- xmonad $ xmobarProp $ myConfig

-- myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
myWorkspaces :: Forest String
myWorkspaces = [ Node "T" 
                   [ Node "Papers" []
                   , Node "Web" []
                   ]
               , Node "P513"      
                   [ Node "Email" []
                   , Node "HW" []
                   , Node "Web" []
                   ]
               , Node "P421"       -- for everyday activity's
                   [ Node "Email" []   --  with 4 extra sub-workspaces, for even more activity's
                   , Node "HW" []
                   ]
               , Node "CS576" -- for all your programming needs
                   [ Node "Email" []
                   , Node "Read"    [] -- documentation
                   , Node "Web"    [] -- documentation
                   ]
               , Node "MISC" -- for all your programming needs
                   [ Node "Web" []
                   , Node "Config"    [] -- documentation
                   ]
               ]
	        -- todo: integrate with dynamic workspace groups

myConfig = def { terminal = "alacritty", workspaces = toWorkspaces myWorkspaces } `additionalKeysP` myKeys `removeKeysP` ["M-p"]
myXPConfig = def { searchPredicate = fuzzyMatch, sorter = fuzzySort }

myKeys = [ ("M-a", spawn "xbacklight -dec 5 &>> /home/max/xmonad.log")
          , ("M-s", spawn "xbacklight -inc 5 &>> /home/max/xmonad.log")
          , ("M-d", spawn "dmenu_run &>> /home/max/xmonad.log")
          , ("M-c", spawn "xfce4-find-cursor")
          , ("M-f", treeselectWorkspace def myWorkspaces W.greedyView)
	  , ("M-S-f", treeselectWorkspace def myWorkspaces W.shift)
	  , ("M-g", selectWindow def >>= (`whenJust` windows . W.focusWindow))
          , ("M-<Esc>", spawn "xfce4-screensaver-command -l &>> /home/max/xmonad.log; bash /home/max/scripts/backup.sh &>> /home/max/xmonad.log")

          -- , ("M-e", viewEmptyWorkspace)
	  -- , ("M-n", addWorkspacePrompt myXPConfig)
	  -- , ("M-v", selectWorkspace myXPConfig)
          
	  , ("M-y n", promptWSGroupAdd myXPConfig "Name this group: ")
          , ("M-y g", promptWSGroupView myXPConfig "Go to group: ")
          , ("M-y d", promptWSGroupForget myXPConfig "Forget group: ")
  ]
