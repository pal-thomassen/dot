local modalKey = {"alt","ctrl"}
local secondaryModalKey = {"alt","shift"}

hs.window.animationDuration = 0.1

local resizeMappings = {
  h=hs.layout.left50,
  j={x=0, y=0.5, w=1, h=0.5},
  k={x=0, y=0, w=1, h=0.5},
  l=hs.layout.right50,
  m={x=0, y=0, w=1, h=1}
}
local subtleResizeMappings = {
  h={x=0.1, y=0.1, w=0.4, h=0.8},
  j={x=0.1, y=0.5, w=0.8, h=0.4},
  k={x=0.1, y=0.1, w=0.8, h=0.4},
  l={x=0.5, y=0.1, w=0.4, h=0.8},
  m={x=0.1, y=0.1, w=0.8, h=0.8}
}

for key in pairs(resizeMappings) do
  hs.hotkey.bind(modalKey, key, function()
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(resizeMappings[key], .1) end
  end)
  hs.hotkey.bind(secondaryModalKey, key, function()
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(subtleResizeMappings[key], .1) end
  end)
end

hs.hotkey.bind(modalKey, 'y', function()
  hs.reload()
  hs.notify.new({title='Hammerspoon Reloaded'}):send()
end)

local focusKeys = {
  a='Safari',
  b='iTunes',
  c='Sketch',
  d='Google Chrome',
  e='Slack',
  f='iTerm',
  g='YNAB',
  i='Inbox',
  n='Spotify',
  o='Messenger',
  p='Flow',
  q='Screenhero',
  r='Brave',
  s='Simulator',
  s='Simulator',
  t='Messages',
  v='Nylas N1',
  w='Dictionary',
  x='Xcode',
  z='Factory'
}

for key in pairs(focusKeys) do
  hs.hotkey.bind(modalKey, key, function()
    hs.application.launchOrFocus(focusKeys[key])
  end)
end

local superModalKey = {'ctrl', 'shift'}
local screenMode = hs.hotkey.modal.new(superModalKey, 's')

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