# emitter v0.0.1

Event emitters for Lua.

```lua
local Emitter = require('emitter')

local emitter = Emitter()

-- Arguments are variadic
function listener(a, b, c)
  print('a =', a)
  print('b =', b)
  print('c =', c)
end

-- Listen forever
emitter:on('foo', listener)

-- Broadcast an event
emitter:emit('foo', 1, 2, 3)

-- Listen for the next event only
emitter:once('foo', function()
  print('just once!')
end)

emitter:len('foo') -- 2
emitter:emit('foo')
emitter:len('foo') -- 1

-- Remove a listener (added via on or once)
emitter:off('foo', listener)

-- Remove all listeners
emitter:off('foo')

-- The event->listeners table
emitter.events
```

Listeners are called in order of `on/once` calls.

By default, unhandled `error` and `warn` events are printed to console.

