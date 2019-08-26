local zencode = require('zencode')

zencode:begin(1)

local script = [[
Scenario 'hello'
Given that my name is 'Julian'
Then say hello
And print all data
]]

zencode:parse(script)
zencode:run({}, {})

-- print("\n---\n")
-- print(ZEN_traceback)
