local value1 = {0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 }
local replacementValues = { 1024,512,256,128, 64, 32, 16, 8, 4, 2, 1 }
local answer = {}
local index = #replacementValues
local sum = 0

while #value1 > 0 and value1[1] == 0 do
    table.remove(value1, 1)
end

for i = #value1, 1, -1 do -- วนลูปจากตำแหน่งสุดท้ายของอาร์เรย์
    if value1[i] == 1 then
        -- หากค่าในอาร์เรย์เป็น 1 ให้นำค่าที่มีการเปลี่ยนแปลงมาใส่
        table.insert(answer, replacementValues[index])
    else
        -- ถ้าไม่ใช่ 1 ให้ ใส่ 0
        table.insert(answer, 0)
    end
    index = index - 1
end

for i = 1, #answer do
    sum = sum + answer[i]
end

local function printArray(array, message)
    io.write(message .. ": ")
    for i = 1, #array do
        io.write(array[i] .. " ")
    end
    io.write("\n")
end

-- สลับค่าจากหลังมาหน้า
local n = #answer
for i = 1, math.floor(n / 2) do
    local temp = answer[i]
    answer[i] = answer[n - i + 1]
    answer[n - i + 1] = temp
end

printArray(value1, "value2  ")
printArray(answer, "value10 ")
print("sum : "..sum)