test = require "tape"

test "Array indexOf", (t) ->
  t.equal ([1, 2, 3].indexOf 1), 0
  t.equal ([1, 2, 3].indexOf 2), 1
  t.equal ([1, 2, 3].indexOf 5), -1
  t.end()
