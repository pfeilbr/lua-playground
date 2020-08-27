-- alias print to keep things concise
l = print

-- global variables
globalVar = "global here"
l('globalVar = ' .. globalVar)

-- local variables
local localVar = "Brian"
l("localVar = " .. localVar)

-- functions
function add(a ,b)
    return a + b
end
l("add(2,3) = " .. add(2,3))

-- types
l(type("Hello world"))  --> string
l(type(10.4*3))         --> number
l(type(print))          --> function
l(type(type))           --> function
l(type(true))           --> boolean
l(type(nil))            --> nil
l(type(type(X)))        --> string

-- tables
do
    local table = {}
    table['name'] = 'john'
    table[0] = 'one'
    l('table[\'name\'] = ' .. table['name'])
    l('table.name = ' .. table.name)
    l('table[0] = ' .. table[0])
end

-- table literal
local names = {'brian', 'tricia', 'wyatt', 'max'}
for i,name in ipairs(names) do
    l("i = " .. i .. ", name = " .. name)
end

local person = {name='brian', age=33, gender='male'}
for key,value in pairs(person) do
    l('key = ' .. key .. ', value = ' .. value)
end

-- type conversion
local ten = tonumber('10')
l('ten = ' .. ten)

-- assignment
do
    local a, b, c = 1, 2, 3
    l('a = ' .. a .. ', b = ' .. b .. ', c = ' .. c)

    local foo = function(a,b)
        return a+1, b+1
    end

    local a1, b1 = foo(2,3)
    l('a1 = ' .. a1 .. ', b1 = ' .. b1)
end

-- loops
for i=1,10 do
   l('i = ' .. i)
end

-- blocks
do
    l('Hello from a block here')
end

-- variable argument lists

function varargs(...)
    for i,v in ipairs(arg) do
        l('i = ' .. tostring(v))
    end
end

-- access all global variable.  they are stored in the _G table
for k,v in pairs(_G) do
    l('k = ' .. k .. ', value = ' .. tostring(v))
end

-- closures
function buildAdder(addValue)
    -- create and return new function that adds 5 to it's argument
    return function(x)
        return x+addValue
    end
end

local addFive = buildAdder(5)
l('addFive(3) = ' .. addFive(3))

-- string manipulation

function string:split(sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    self:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

local letterString = 'a,b,c'
local letters = letterString:split(',')
l(letters)

-- date / time
l('current time (seconds since epoch) = ' .. tostring( os.time() ))

local name = 'brian'
if name ~= 'tricia' then
    l('name is incorrect')
else
    l('name is correct')
end

local fields = {['TelecomType'] = true, ['TelecomLovID'] = true}

if fields['TelecomLovIDs'] then
    l("found")
else
    l("not found")
end

for key,value in pairs(fields) do
    l(tostring(fields[key]))
end

UIHelper = {}

function UIHelper:deleteEmptyRows()
    l('UIHelper:deleteEmptyRows called')
end


arr = {1, 3, 2}
l('length of arr: ' .. tostring(#arr))
l( 'elements in  arr = ' .. tostring(#arr) )
table.sort(arr)
l( tostring( arr[#arr] ) )

l('arr[1] = ' .. tostring(arr[1]) )

if _G['Account Dropdown List'] then
    l('found')
else
    l('not found')
end

_G['Account Dropdown List'] = 'here now'

if _G['Account Dropdown List'] then
    l('found')
else
    l('not found')
end

_G['Account Dropdown List Callback'] = function()
    l('callback here')
end

_G['Account Dropdown List Callback']()

if _G['Account Dropdown List Callback'] then
    _G['Account Dropdown List Callback']()
    _G['Account Dropdown List Callback'] = nil
end

if gProductDetailListBuilderMaxPriority ~= -1 then
end

local v = nil
if not v then
    l('v is nil')
end
local qw = nil
if not qw  then
    l('no qw here')
end

local name = 'brian'

if not (name == 'lo') then
    l('lolo')
end

-- functions in tables

local fns = {}

function fns.foo()
  return 'fns.foo'
end

function fns.bar()
  return 'fns.bar'
end

l(fns.foo())
l(fns.bar())

for name, fn in next, fns do
  l('name=' .. name .. ',fn=' .. fn())
end

-- dynamic code execution / evaluation
local code = '1+2+3'
local res = load('return ' .. code)()
l('res=' .. res)

-- variable function arguments
function args(...)
  -- number of args
  local args_count = select('#', ...)
  l('args_count=' .. args_count)

  local first_arg = select(1, ...)
  local second_arg = select(2, ...)

  l('first_arg=' .. first_arg)
  l('second_arg=' .. second_arg)
end
l(args('apples','milk','bread'))
