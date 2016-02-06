local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"

local modalKey = {"alt","ctrl"}

local resizeMappings = {
  h={x=0, y=0, w=0.5, h=1},
  j={x=0, y=0.5, w=1, h=0.5},
  k={x=0, y=0, w=1, h=0.5},
  l={x=0.5, y=0, w=0.5, h=1},
  m={x=0, y=0, w=1, h=1}
}
local superResizeMappings = {
  h={x=0, y=0, w=0.25, h=1},
  j={x=0, y=0.75, w=1, h=0.25},
  k={x=0, y=0, w=1, h=0.25},
  l={x=0.75, y=0, w=0.25, h=1},
}

for key in pairs(resizeMappings) do
  hotkey.bind(modalKey, key, function()
    local win = window.focusedwindow()
    if win then win:movetounit(resizeMappings[key]) end
  end)
end

hotkey.bind(modalKey, "r", function()
  mjolnir.reload()
end)

local focusKeys = {
  a='Safari',
  c='Sketch',
  v='Evernote',
  d='Google Chrome',
  q='VirtualBoxVM',
  e='Slack',
  f='iTerm',
  s='iOS Simulator',
  n='Spotify',
  p='Flow',
  o='Messenger',
  t='Messages',
  w='Dictionary',
  x='Xcode',
  y='Screenhero'
}
for key in pairs(focusKeys) do
  hotkey.bind(modalKey, key, function()
    application.launchorfocus(focusKeys[key])
  end)
end
