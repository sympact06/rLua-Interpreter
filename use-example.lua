local InFile = io.open('luac.out', 'rb')

local Script = InFile:read'*a'

InFile:close()

os.remove('luac.out')
os.remove('Out1.lua')

local rLuaFile = io.open('rLua.lua', 'rb')

local rLua = rLuaFile:read'*a'

rLuaFile:close()

Script = Script:gsub(".", function(bb) return "\\" .. bb:byte() end) or Script .. "\""

Script = rLua .. '("'..Script..'")()'

local OutFile = io.open('Out.lua', 'w+')

OutFile:write(Script)

OutFile:close()

print('Finished')
