# Zencode

Zencode is a human readable Domain-specific language tool written for the Lua Virtual Machine. Zencode imports "Scenarios" in order to build the flexible functionality of the DSL for certain use cases.

This Zencode core module has been extracted from the DECODEProject's [Zenroom](https://github.com/DECODEproject/zenroom) and lightly modified to provide more flexible Scenario loading abilities and a more portable environment.

Zencode has been tested against Lua 5.3.5 PUC-Rio.

## Usage

View [examples](examples) for a more detailed look at usage. In addition you can run `make run-examples` to test the code yourself.

### Scenario

Zencode first requires a scenario to build the DSL

```lua
-- zencode_hello.lua

Given("that my name is ''", function(name)
    ACK.name = name
end)

Then("say hello", function()
    OUT = "Hello, " .. ACK.name .. "!"
end)

Then("print all data", function()
    print(OUT)
end)
```

The `Given` keyword defines patterns which take in input and apply them to subsequent steps. In practice this means taking parameters and the `IN` table and transforming / applying them to `ACK`

The `Then` keyword defines patterns to transform data. This usually implies transforming data in `ACK` and applying them to `OUT`.

`When` keywords not shown here apply conditional logic.

### Running

To run the code we use the built-in `parse` and `run` commands, as well as `load_scenario` to make the scenario above available to the Zencode.

```lua
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
```

Although we can run Zencode in straight Lua, it's more useful to define the execution environment with a Sandboxed Lua VM, as provided by [zenroom_minimal](https://github.com/RiddleAndCode/zenroom_minimal) for example.
