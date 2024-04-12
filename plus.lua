local value0 = { 0 } -- เก็บเลขทด
local value1 = { 1, 0, 1 }
local value2 = { 1, 1, 0, 1 }
local value3 = {} -- ตารางที่จะเก็บผลลัพธ์
local value4 = {}
-- เพิ่มตัวเลข 0 ในด้านหน้าของอาร์เรย์ value2 จนกว่าจะมีจำนวนสมาชิกเท่ากับอาร์เรย์ value1

while #value2 < #value1 do
    -- จะเพิ่ม 0 เข้าไปในตำแหน่งที่ 1 ของอาร์เรย์ value2
    table.insert(value2, 1, 0)
end
while #value1 < #value2 do
    -- จะเพิ่ม 0 เข้าไปในตำแหน่งที่ 1 ของอาร์เรย์ value2
    table.insert(value1, 1, 0)
end


local function printArray(array, message)
    io.write(message .. ": ")
    for i = 1, #array do
        io.write(array[i] .. " ")
    end
    io.write("\n")
end

printArray(value1, "value 1 befor")
printArray(value2, "Value 2 befor")

--  ~=

for i = #value1, 1, -1 do
    -- สำหรับค่าซ้ำ้กัน
    if value1[i] == value2[i] then
        -- 0+0
        if value1[i] == 0 and value2[i] == 0 then
            table.insert(value0, 0)
            table.insert(value3, 0)
            -- 1+1
        elseif value1[i] == 1 and value2[i] == 1 then
            table.insert(value3, 0)
            table.insert(value0, 1)
        end
    elseif value1[i] ~= value2[i] then
        -- 1+0
        if (value1[i] == 1 or value2[i] == 1 )and value1[i] ~= value2[i] then
            table.insert(value3, 1)
            table.insert(value0, 0)
        end
    end
end

-- สลับค่าจากหลังมาหน้า--[[]]
local n = #value0
for i = 1, math.floor(n / 2) do
    local temp = value0[i]
    value0[i] = value0[n - i + 1]
    value0[n - i + 1] = temp
end
-- สลับค่าจากหลังมาหน้า
local n = #value3
for i = 1, math.floor(n / 2) do
    local temp = value3[i]
    value3[i] = value3[n - i + 1]
    value3[n - i + 1] = temp
end

-- value0 กับ value3
for i = 1, #value0 do
    if (value0[i] == 1 and value3[i] == 0) or (value0[i] == 0 and value3[i] == 1) then
        table.insert(value4, 1)
    elseif value0[i] == 0 and value3[i] == 0 and ( value3[i] == nil or value3 ~= nil ) then
        table.insert(value4, 0)
    elseif value3[i] == nil and value0[i] == 0 then
        table.insert(value4, 0)
    elseif value3[i] == nil and value0[i] == 1 then
        table.insert(value4, 1)
    end
end

printArray(value0, "value0 ")
printArray(value3, "value3 ")
printArray(value4, "anewer ")
