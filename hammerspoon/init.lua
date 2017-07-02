local hyper = {"ctrl", "alt", "shift"}

-- disable animations
hs.window.animationDuration = 0

-- hide window shadows
hs.window.setShadows(false)

local fnutils = require "hs.fnutils"
local partial = fnutils.partial
local indexOf = fnutils.indexOf
local filter = fnutils.filter

local window = require "hs.window"
local alert = require "hs.alert"
local grid = require "hs.grid"

require "fntools"
require "extensions"
require "keyboard_grid"

yay = ""
boo = ""

hs.crash.crashLogToNSLog = true

---------------------------------------------------------
-- SCREENS
---------------------------------------------------------

local screenMode = hs.hotkey.modal.new(hyper, 'z')

screenMode:bind('', 'escape', function() screenMode:exit() end)

function screenMode:entered() hs.alert('Screen Mode') end

screenMode:bind('', 'l', function()
                  local win = hs.window.focusedWindow()
                  if win then win:moveOneScreenEast() end
                  screenMode:exit()
end)
screenMode:bind('', 'j', function()
                  local win = hs.window.focusedWindow()
                  if win then win:moveOneScreenSouth() end
                  screenMode:exit()
end)
screenMode:bind('', 'k', function()
                  local win = hs.window.focusedWindow()
                  if win then win:moveOneScreenNorth() end
                  screenMode:exit()
end)
screenMode:bind('', 'h' , function()
                  local win = hs.window.focusedWindow()
                  if win then win:moveOneScreenWest() end
                  screenMode:exit()
end)

-- screenOrder = {
--     "Color LCD"
-- }

-- screenMoveMode = hs.hotkey.modal.new(hyper, "s")
-- function screenMoveMode:entered()
--   hs.alert.show('Mode: Move to screen', 10)

--   -- main display = 1
--   -- screen to

--   manualScreenOrder = {
--       [69677504] = 1 -- Macbook display
--   }
--   screenMappings = {}
--   allScreens = hs.screen.allScreens()

--   for i, screen in pairs(allScreens) do
--     local id = screen:id()
--     local name = screen:name()

--     hs.alert(string.format('display: %s real ID: %s', name, id), 10)
--   end
-- end

-- function screenMoveMode:exited()  hs.alert.show('Exited mode')  end

---------------------------------------------------------
-- APP HOTKEYS
---------------------------------------------------------

local SIGNAL_CHROME_APP_NAME = 'Profile 1 bikioccmkafdpakkkcpdbppfkghcmihk'

hs.hotkey.bind(hyper, "a", launchOrCycleFocus("Safari"))
hs.hotkey.bind(hyper, "b", launchOrCycleFocus("iTunes"))
hs.hotkey.bind(hyper, "c", launchOrCycleFocus("Sketch"))
hs.hotkey.bind(hyper, "d", launchOrCycleFocus("Google Chrome"))
hs.hotkey.bind(hyper, "e", launchOrCycleFocus("Slack"))
hs.hotkey.bind(hyper, "f", launchOrCycleFocus("iTerm", "iTerm2"))
hs.hotkey.bind(hyper, "i", launchOrCycleFocus(SIGNAL_CHROME_APP_NAME))
hs.hotkey.bind(hyper, "n", launchOrCycleFocus("Spotify"))
hs.hotkey.bind(hyper, "r", launchOrCycleFocus("Brave"))
hs.hotkey.bind(hyper, "s", launchOrCycleFocus("Simulator"))
hs.hotkey.bind(hyper, "t", launchOrCycleFocus("Messages"))
hs.hotkey.bind(hyper, "u", launchOrCycleFocus("clementine"))
hs.hotkey.bind(hyper, "w", launchOrCycleFocus("Dictionary"))
hs.hotkey.bind(hyper, "x", launchOrCycleFocus("XCode"))
hs.hotkey.bind(hyper, "o", launchOrCycleFocus("Finder"))

hs.hotkey.bind(hyper, "m", fullScreenCurrent)
-- hs.hotkey.bind(hyper, "D", screenToRight)
-- hs.hotkey.bind(hyper, "A", screenToLeft)

---------------------------------------------------------
-- ON-THE-FLY KEYBIND
---------------------------------------------------------

-- Temporarily bind an application to be toggled by the V key
-- useful for once-in-a-while applications like Preview
local boundApplication = nil

hs.hotkey.bind(hyper, "b", function()
  local appName = hs.window.focusedWindow():application():title()

  if boundApplication then
    boundApplication:disable()
  end

  boundApplication = hs.hotkey.bind(hyper, "V", launchOrCycleFocus(appName))

  -- https://github.com/Hammerspoon/hammerspoon/issues/184#issuecomment-102835860
  boundApplication:disable()
  boundApplication:enable()

  hs.alert(string.format("Binding: \"%s\" => ⌘ + V", appName))
end)

-- # RESIZE

-- HJKL Resize
local resizeMappings = {
  h=hs.layout.left50,
  j={x=0, y=0.5, w=1, h=0.5},
  k={x=0, y=0, w=1, h=0.5},
  l=hs.layout.right50,
  m={x=0, y=0, w=1, h=1}
}

for key in pairs(resizeMappings) do
  hs.hotkey.bind(hyper, key, function()
  local win = hs.window.focusedWindow()
  if win then win:moveToUnit(resizeMappings[key], .1) end
  end)
end


---------------------------------------------------------
-- MISC
---------------------------------------------------------

hs.hotkey.bind(hyper, "p", function()
  local current = hs.application.frontmostApplication()
  current:selectMenuItem({"Help"})
end)

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
  hs.notify.new({title='Hammerspoon Reloaded'}):send()
end)
