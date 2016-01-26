--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import System.Exit
import System.IO

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Char
import Data.String

import Graphics.X11.ExtraTypes.XF86
import XMonad.Actions.CopyWindow
import XMonad.Actions.GroupNavigation
import XMonad.Actions.WindowBringer
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName
import XMonad.Layout.Gaps
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.Reflect
import XMonad.Layout.ThreeColumns
--import XMonad.Prompt
--import XMonad.Prompt.Window
--import XMonad.Prompt.Shell
--import XMonad.Util.Dmenu
import XMonad.Util.NamedWindows
import XMonad.Util.Run
import XMonad.Util.WorkspaceCompare

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal    = "urxvt"
terminalRun   = myTerminal ++ " -e sh -c "
browser       = "google-chrome"
monitor       = terminalRun ++ "glances"
taskManager   = terminalRun ++ "htop"
--calculator    = "gnome-calculator"
{-chrome        = "google-chrome"-}
files         = terminalRun ++ "ranger"
editor        = terminalRun ++ "nvim"
mail          = browser ++ " -n inbox.google.com"
--mail          = terminalRun ++ "vmail"
--pandora       = terminalRun ++ "pianobar"
--myMenu        =  ".cabal/bin/yeganesh -x -- "
--              ++ "-p \"Run:\" "
--              ++ unwords dmenuArgs
--              ++ " | sh"
--autorandr     = "autorandr -c"
--suspend       = "systemctl suspend"

-- Volume keys
--volume_mute = "pulseaudio-ctl mute"
--volume_up   = "pulseaudio-ctl up"
--volume_down = "pulseaudio-ctl down"

-- Dmenu setup
--quote = wrap "\"" "\""
--dmenuArgs = [ "-i"
--            , "-fn " ++ quote myShellFont
--            , "-nb " ++ quote myShellBgColor
--            , "-nf " ++ quote myShellFgColor
--            , "-sb " ++ quote myShellBgHLight
--            , "-sf " ++ quote myShellFgHLight
--            ]

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod1Mask
altMask         = mod1Mask

-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
myNumlockMask   = mod2Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
-- myWorkspaces    = ["1:web","2:dev","3","4","5","6","7:gmail","8:music","9"]
-- 1 to 10 + F1 to F10
myWorkspaces    = map show [1..10] ++ map (\x -> "F" ++ show x) [1..10]

-- Width of the window border in pixels.
--
myBorderWidth   = 1
mySpacingWidth  = 6

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#999999"
myFocusedBorderColor = "#fb007a"

-- XMobar colours

-- Color of current window title in xmobar.
--xmobarTitleColor = "#839496"

-- Color of current workspace in xmobar.
--xmobarCurrentWsColor = myFocusedBorderColor
--xmobarActiveWsColor = "#839496"
--xmobarInactiveWsColor = "#586e75"
--xmobarUrgentWsColor = "#E52222"

------------------------------------------------------------------------
-- Shell Config:
--
-- Test if chars occur in order in another string
--isSequentialSublist :: (Eq a) => [a] -> [a] -> Bool
--isSequentialSublist [] _ = True
--isSequentialSublist _ [] = False
--isSequentialSublist (x:xs) (y:ys) | x == y    = isSequentialSublist xs ys
                                 -- | otherwise = isSequentialSublist (x:xs) ys
--mySearchPredicate :: String -> String -> Bool
--mySearchPredicate [] [] = True
--mySearchPredicate xs ys = isSequentialSublist (map toLower xs) (map toLower ys)

--myShellFont     = "Terminus-9"
--myShellFgColor  = "#839496"
--myShellBgColor  = "#002b36"
--myShellFgHLight = "#002b36"
--myShellBgHLight = myFocusedBorderColor

--myXPConfig = defaultXPConfig {
    --font              = "xft:" ++ myShellFont
  --, bgColor           = myShellBgColor
  --, fgColor           = myShellFgColor
  --, fgHLight          = myShellFgHLight
  --, bgHLight          = myShellBgHLight
  --, borderColor       = myShellBgColor
  --, promptBorderWidth = 0
  --, height            = 18
  -- , autoComplete      = Just 250000
  --, alwaysHighlight   = True
  --, searchPredicate   = mySearchPredicate
  --, position          = Top
--}

------------------------------------------------------------------------
-- Urgency Hook:
--
-- Use libnotify notifications when the X11 urgent hint is set
--data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)
--instance UrgencyHook LibNotifyUrgencyHook where
  --urgencyHook LibNotifyUrgencyHook w = do
    --name <- getName w
    --wins <- gets windowset
    --whenJust (W.findTag w wins) (flash name)
    --where flash name index = spawn $ "notify-send " ++ "'Workspace "    ++ index     ++ "' "
                                                    {-++ "'Activity in: " ++ show name ++ "' "-}
                                                    {-++ "--icon=notification-gpm-monitor"-}

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- launch a terminal
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- close focused window
    --, ((modMask .|. shiftMask, xK_q     ), kill)

    -- Close window on current workspace
    , ((modMask .|. shiftMask, xK_q     ), kill1)

     -- Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modMask,               xK_n     ), refresh)

    -- Move focus to the next window
    {-, ((modMask,               xK_Tab   ), windows W.focusDown)-}

    -- Move focus to the next window
    , ((modMask,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modMask,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modMask,                xK_h     ), windows W.focusMaster  )

    -- Maximize the focused window temporarily
    --, ((modMask,               xK_m     ), withFocused $ sendMessage . maximizeRestore)

    -- Swap the focused window and the master window
    , ((modMask,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modMask,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modMask,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))

    -- Quit xmonad
    , ((modMask .|. shiftMask, xK_BackSpace     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    -- , ((modMask              , xK_q     ), restart "xmonad" True)
    , ((modMask              , xK_BackSpace     ), restart "xmonad" True)

    -- Suspend
    {-, ((modMask              , xK_End           ), spawn suspend)-}

    -- to hide/unhide the panel
    , ((modMask              , xK_b), sendMessage ToggleStruts)

    -- Volume

    -- XF86AudioMute
    {-, ((0 , xF86XK_AudioMute), spawn volume_mute)-}
     {-XF86AudioLowerVolume-}
    {-, ((0 , xF86XK_AudioLowerVolume), spawn volume_down)-}
    -- XF86AudioRaiseVolume
    {-, ((0 , xF86XK_AudioRaiseVolume), spawn volume_up)-}

    -- calculator
    {-, ((0, xF86XK_Calculator), spawn calculator)-}

    -- browser
    {-, ((0,           xF86XK_Favorites), spawn browser)-}
    , ((modMask .|. shiftMask,   xK_i), spawn browser)

    -- Chrome
    {-, ((modMask .|. shiftMask,   xK_g), spawn chrome)-}

    -- mail
    , ((modMask .|. controlMask,   xK_i), spawn mail)

    -- system monitor
    , ((altMask .|. controlMask, xK_Delete), spawn monitor)

    -- advanced system monitor
    , ((altMask .|. shiftMask, xK_Delete), spawn taskManager)

    -- file browser
    , ((modMask .|. controlMask, xK_Return), spawn files)

    -- pandora
    --, ((modMask .|. shiftMask, xK_p), spawn pandora)

    -- editor
    , ((modMask,                 xK_grave), spawn editor)

    -- Window search
    --, ((modMask              , xK_slash ), windowPromptGoto  myXPConfig)
    --, ((modMask .|. shiftMask, xK_slash ), windowPromptBring myXPConfig)
    --, ((modMask .|. shiftMask .|. controlMask, xK_slash ), windowPromptBringCopy myXPConfig)

    -- History cycling
    , ((modMask              , xK_o), nextMatch History  (return True))
    {-, ((modMask              , xK_i), nextMatch Backward (return True))-}

    -- Shell prompt
    {-, ((modMask              , xK_p), shellPrompt myXPConfig)-}
    {-, ((modMask .|. shiftMask, xK_c), prompt (terminalRun) myXPConfig)-}

    -- menu
    --, ((modMask              , xK_p), spawn myMenu)

    -- set screens
    --, ((modMask              , xK_Print), spawn autorandr)
    ]

    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    --[((m .|. modMask, k), windows $ f i)
    --    | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    --    , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++

    -- mod-[1..9] @@ Switch to workspace N
    -- mod-shift-[1..9] @@ Move client to workspace N
    -- mod-control-shift-[1..9] @@ Copy client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) workspaceKeys
        , (f, m) <- [
              {-(W.view, 0)-}
              (W.greedyView, 0)
            , (W.shift, shiftMask)
            , (copy, shiftMask .|. controlMask)
          ]
    ]
    where workspaceKeys = [xK_1 ..xK_9] ++ [xK_0] ++ [xK_F1 .. xK_F10]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask .|. shiftMask, button1), (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask .|. shiftMask, button2), (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask .|. shiftMask, button3), (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)

    -- Mouse scroll can resize main
    , ((modMask, button4), (\w -> sendMessage Shrink))
    , ((modMask, button5), (\w -> sendMessage Expand))

    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
--myLayout = maximize (tiled) ||| Mirror tiled ||| Full
--  where
--     -- default tiling algorithm partitions the screen into two panes
--     tiled   = Tall nmaster delta ratio

--     -- The default number of windows in the master pane
--     nmaster = 1

--     -- Default proportion of screen occupied by master pane
--     ratio   = 1/2

--     -- Percent of screen to increment by when resizing panes
--     delta   = 3/100

myLayout = smartSpacing mySpacingWidth
    -- $ gaps zip [U,R,D,L] mySpacingWidth
    $ avoidStruts
    -- IM layout on 6
    {-$ onWorkspace "6" imLayout-}
    $ standardLayouts

    where
      standardLayouts =
        Tall 1 (3/100) (1/2) |||
        -- Tall 1 (3/100) (7/10) |||
        Mirror (Tall 1 (3/100) (1/2)) |||
        -- Mirror (Tall 1 (3/100) (3/4)) |||
        ThreeCol 1 (3/100) (1/2) |||
        Full

      imLayout = withIM (1/4) (Title "Messenger")
        (Mirror (GridRatio (1)) ||| standardLayouts)

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ isFullscreen --> doFullFloat
    , manageHook defaultConfig
    , className =? "File Operation Progress"  --> doFloat
    , resource =? "Do" --> doIgnore
    , resource  =? "desktop_window" --> doIgnore
    ]

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
--
-- To emulate dwm's status bar
--
-- > logHook = dynamicLogDzen
--
-- ewmhDesktopsLogHook
--myLogHook = dynamicLog

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook = return ()

-- Enable compositing for transparency, shaped windows, smooth transitions, etc.
--   -f = enable window fading
--   -I = opacity step in
--   -O = opacity step out
--   --backend glx = better performance
--   --vsync opengl = doesn't work for all drivers, see 'man compton'
--
-- Rebind backward/forward keys to home/end.
--myStartupHook :: X ()
--myStartupHook = do
  --spawn "compton -f -I 0.10 -O 0.10 --backend glx --vsync opengl"
  --spawn "notify-send 'Xmonad Started/Recompiled' --icon=emblem-system"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main :: IO ()
main = 
  xmonad $ defaults { logHook = historyHook >> ewmhDesktopsLogHook }

------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = ewmh defaultConfig  {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = smartBorders $ myLayout,
        manageHook         = manageDocks <+> myManageHook,
        --startupHook        = myStartupHook,
        handleEventHook    = fullscreenEventHook
    }
