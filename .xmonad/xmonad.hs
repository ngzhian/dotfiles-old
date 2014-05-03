import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , logHook    = dynamicLogWithPP xmobarPP
                       { ppOutput = hPutStrLn xmproc
                       , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
                       , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
                       , ppSep = "  |  "
                       }
    , modMask = mod4Mask    -- Rebind Mod to Windows key
    , workspaces = myWorkspaces
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor  = myNormalBorderColor
    , borderWidth        = myBorderWidth
    , terminal = myTerminal -- set terminal
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask,    xK_l),     spawn "xscreensaver-command -lock")
    -- Mod+Shift+L locks
    , ((controlMask,               xK_Print), spawn "sleep 0.2; scrot -s")
    -- Ctrl-Print Screen takes a picture of a window
    , ((0,                         xK_Print), spawn "scrot")
    -- Print Screen fires up scrot
    ]

-- My preferred terminal
myTerminal = "/usr/bin/urxvt"

-- Managing hooks when windows are created
-- Can use this to send windows to a particular workspace
-- or set its layout
myManageHook = composeAll
  [ className =? "Gimp" --> doFloat
  , className =? "Firefox" --> doShift "2:web"
  , className =? "Iceweasel" --> doShift "2:web"
  ]

-- XMonad gives us 9 workspaces by default, just name the first 4
myWorkspaces = ["1:term", "2:web", "3:code", "4:stuff"] ++ map show [5..9] 

-- Colors and borders
-- Currently based on the ir_black theme.
myNormalBorderColor  = "#5f5f5f"
myFocusedBorderColor = "#4bb5c1"

myBorderWidth = 2

-- Color of current window title in xmobar.
xmobarTitleColor = "#303030"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#303030"
