local *

class Emitter
  new: =>
    @events = {}

  @setFallback: (name, listener) ->
    fallbacks[name] = listener

  emit: (name, ...) =>
    listeners = @events[name]
    if listeners == nil
      listener = fallbacks[name]
      listener ... if listener
      return self

    current = listeners
    listeners, len = {}, 0
    for i, listener in ipairs current
      continue if listener == false
      if off ~= listener ...
        listener = current[i]
        if listener ~= false
          len += 1
          listeners[len] = listener

    if len > 0
      @events[name] = listeners
      listeners.len = len
      return self

    @events[name] = nil
    return self

  on: (name, listener) =>
    listeners = @events[name]
    if listeners == nil
      listeners = {len: 1}
      @events[name] = listeners
    else listeners.len += 1

    :len = listeners
    listeners[len] = listener
    return self

  once: (name, listener) =>
    @on name, setmetatable {
      emitter: self
      :name
      :listener
    }, once_mt

  off: (...) =>
    name, listener = ...
    if select('#', ...) == 1
      @events[name] = nil
      return self

    listeners = @events[name]
    if listeners ~= nil
      {:len} = listeners
      for i, item in ipairs listeners

        if type(item) == 'function'
          continue if item ~= listener
        elseif item.listener ~= listener
          continue

        if len > 1
          listeners.len = len - 1
          listeners[i] = false
          break

        @events[name] = nil
        break

      return self
    return self

  len: (name) =>
    listeners = @events[name]
    return 0 if listeners == nil
    return listeners.len

off = {}
once_mt =
  __call: (...) =>
    self.listener ...
    return off

no_warnings = os.getenv('NO_WARNINGS')
trace_warnings = os.getenv('TRACE_WARNINGS')
fallbacks =
  error: (...) ->
    print table.concat {'error:', ...}, ' '
    print debug.traceback()
  warn: if not no_warnings then (...) ->
    print table.concat {'warn:', ...}, ' '
    print debug.traceback() if trace_warnings

return Emitter
