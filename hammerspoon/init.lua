local modalKey = {"alt","ctrl"}

hs.window.animationDuration = 0.1

local resizeMappings = {
  h=hs.layout.left50,
  j={x=0, y=0.5, w=1, h=0.5},
  k={x=0, y=0, w=1, h=0.5},
  l=hs.layout.right50,
  m={x=0, y=0, w=1, h=1}
}
local superResizeMappings = {
  h={x=0, y=0, w=0.25, h=1},
  j={x=0, y=0.75, w=1, h=0.25},
  k={x=0, y=0, w=1, h=0.25},
  l={x=0.75, y=0, w=0.25, h=1},
}

for key in pairs(resizeMappings) do
  hs.hotkey.bind(modalKey, key, function()
    local win = hs.window.focusedWindow()
    if win then win:moveToUnit(resizeMappings[key], .1) end
  end)
end

hs.hotkey.bind(modalKey, 'y', function()
  hs.reload()
  hs.notify.new({title='Hammerspoon Reloaded'}):send()
end)

local focusKeys = {
  a='Safari',
  c='Sketch',
  d='Google Chrome',
  e='Slack',
  f='iTerm',
  b='iTunes',
  n='Spotify',
  o='Messenger',
  p='Flow',
  q='Screenhero',
  r='Remember The Milk',
  s='Simulator',
  t='Messages',
  v='Evernote',
  w='Dictionary',
  x='Xcode'
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
screenMode:bind('', 'h' , function()
  local win = hs.window.focusedWindow()
  if win then win:moveOneScreenWest() end
  screenMode:exit()
end)