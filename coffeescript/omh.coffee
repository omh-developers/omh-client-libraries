if typeof jQuery is "undefined"
  alert "dpu.js requires jQuery version 1.7 or above." + "Please include it in your document."
else
  console.log "jquery is loaded, sweet!"
Function::defaults = ->
  _f = this
  _a = Array(_f.length - arguments.length).concat(Array::slice.apply(arguments))
  ->
    _f.apply _f, Array::slice.apply(arguments).concat(_a.slice(arguments.length, _a.length))

Function::clone = ->
  that = this
  temp = temporary = ->
    that.apply this, arguments

  for key of this
    temp[key] = this[key]
  temp

unless Array::each
  Array::each = (fun) ->
    len = @length >>> 0
    throw new TypeError()  unless typeof fun is "function"
    thisp = arguments[1]
    i = 0

    while i < len
      fun.call thisp, this[i], i, this  if i of this
      i++
omh = ->
  range: ->
    return []  unless arguments.length
    min = undefined
    max = undefined
    step = undefined
    if arguments.length is 1
      min = 0
      max = arguments[0] - 1
      step = 1
    else
      min = arguments[0]
      max = arguments[1] - 1
      step = arguments[2] or 1
    if step < 0 and min >= max
      step *= -1
      tmp = min
      min = max
      max = tmp
      min += ((max - min) % step)
    a = []
    i = min

    while i <= max
      a.push i
      i += step
    a
