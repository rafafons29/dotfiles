local Animation = noty.get_plugin('animation')
if not Animation then return end

local duration = 300 -- ms
local fps = 90       -- frames per second
local easing = require('animation.easing')

local i = 0

local function callback(fraction)
  i = i + 1
end

local animation = Animation(duration, fps, easing.line, callback)
animation:run()
