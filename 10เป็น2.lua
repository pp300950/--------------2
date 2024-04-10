--[[local function divideByTwo(number)
    local resultArray = {}  
    
    while number > 1 do  
        if number % 2 == 0 then
            -- ถ้าหาร 2 ลงตัว ให้เพิ่ม 0 เข้าอาเรย์
            table.insert(resultArray, 1, 0)
            number = number / 2
        else
            -- ถ้ามีเศษหาร ให้เพิ่ม 1 เข้าไปในตำแหน่งใหม่ของอาเรย์ และลบ 1 ออก
            table.insert(resultArray, 1, 1)
            number = (number - 1) / 2
        end
    end

    -- เมื่อตัวเลขลดลงมาเหลือเพียง 1 ให้เพิ่ม 1 เข้าไปในตำแหน่งใหม่ของอาเรย์
    table.insert(resultArray, 1, 1)

    return resultArray
end

local number = 300  
local result = divideByTwo(number)

for i = 1, #result do
    io.write(result[i] .. " ")
end
io.write("\n")]]


local value1 = 133
local replacementValues = { 1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1 }
local answer = {}
local sum = 0

for i = 1, #replacementValues do
    if value1 - replacementValues[i] >= 0 then
        -- หากการเพิ่มค่าเลข 1 ในตำแหน่งนี้ทำให้ผลรวมเกินค่า 133 ให้ใส่ 0 แทน
        if sum + replacementValues[i] > value1 then
            table.insert(answer, 0)
        else
            table.insert(answer, 1)
            sum = sum + replacementValues[i]
        end
    else
        table.insert(answer, 0)
    end
end

print(value1)
for i = 1, #answer do
    io.write(answer[i] .. " ")
end
io.write("\n")