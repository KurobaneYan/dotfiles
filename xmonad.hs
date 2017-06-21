import XMonad
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig ( additionalKeys, removeKeys )
import System.Exit
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

main = xmonad $ myConfig

myWorkspaces = map show [1..9]
myNumRow = [xK_ampersand
           , xK_bracketleft
           , xK_braceleft
           , xK_braceright
           , xK_parenleft
           , xK_equal
           , xK_asterisk
           , xK_parenright
           , xK_plus]

myConfig = defaultConfig
    { terminal = "gnome-terminal"
    , modMask = mod4Mask
    , borderWidth = 1
    , normalBorderColor = "#181715"
    , focusedBorderColor = "#58C5F1"
    , focusFollowsMouse = True
    , layoutHook = smartBorders $ layoutHook defaultConfig
    , handleEventHook = fullscreenEventHook
    , keys = \c -> myKeys c `M.union` (keys defaultConfig c)
    } `removeKeys` myRemoveKeys

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {modMask = modm}) =
    M.fromList $ [((m.|. modm, k), windows $ f i)
             | (i,k) <- zip (XMonad.workspaces conf) myNumRow
             , (f,m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
 ++ [ ((mod4Mask,               xK_Return), spawn "gnome-terminal")
    , ((mod4Mask .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((mod4Mask,               xK_slash ), sendMessage NextLayout)
    , ((mod4Mask .|. shiftMask, xK_slash ), sendMessage FirstLayout)
    , ((mod4Mask .|. shiftMask, xK_q), kill)
    , ((mod4Mask .|. shiftMask, xK_e), io (exitWith ExitSuccess))
    , ((mod4Mask .|. shiftMask, xK_r), spawn restartXmonad)
    , ((mod4Mask,               xK_x), spawn scrotActiveWindow)
    , ((mod4Mask .|. shiftMask, xK_x), spawn scrotAll)
    ]

myRemoveKeys =
    [(mod4Mask, xK_q)
    , (mod4Mask, xK_space)
    , (mod4Mask .|. shiftMask, xK_c)
    ]

scrotActiveWindow = "scrot '%Y-%m-%d-%H%M%S.png' -b -u -e 'mv $f ~/Pictures/'"
scrotAll = "scrot '%Y-%m-%d-%H%M%S-full.png' -e 'mv $f ~/Pictures/'"
restartXmonad = "if type xmonad; then\
\   xmonad --recompile && xmonad --restart;\
\else\
\   xmessage xmonad not in \\$PATH: \"$PATH\";\
\fi"
