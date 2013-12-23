
-- How to use C pointer in Lua
a = 1
b = 2
print(a, b)
c, d = mylua.swap(a, b)	-- Output has two data, if original function's return type is void
print(a, b)				-- a, b don't change
print(c, d)				-- c == b and a == d
--[[
 console will display as follows:
 1 	2
 1 	2
 2	1
]]

-- How to use C array
t = {}
t2 = {}
t3 = {}
t4 = {}
-- Initialize array
for i = 1, 5 do
	t[i] = 0
	t2[i] = 0
	t3[i] = 0
	t4[i] = 0
end
t = mylua.array_write(t)
t2 = mylua.array_write3(t2, 5)
t3 = mylua.array_write4(6, t3)
t4 = mylua.array_write7(t4)
for i = 1, 5 do
	print(t[i] .. ", " .. t2[i] .. "," .. t3[i] .. "," .. t4[i])
end
