
--local value1 = {1, 0, 0, 1}
--local value2 = {1, 0, 0, 0, 0, 0, 0, 0, 1}
local value1 = { 1, 1, 0, 1 }
local value2 = { 0, 0, 1 }
local value3 = {} -- ตารางที่จะเก็บผลลัพธ์
local temp = {}

-- เพิ่มตัวเลข 0 ในด้านหน้าของอาร์เรย์ value2 จนกว่าจะมีจำนวนสมาชิกเท่ากับอาร์เรย์ value1
while #value2 < #value1 do
    -- จะเพิ่ม 0 เข้าไปในตำแหน่งที่ 1 ของอาร์เรย์ value2
    table.insert(value2, 1, 0)
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

-- ติดลบ
if #value1 < #value2 then
    
end

for i = 1, #value1 do
    -- ตรวจสอบว่าค่าจาก value2 มีค่ามากกว่าหรือเท่ากับ value1
    if value2[i] >= value1[i] then
        -- ลูปใน value1
        for k = 1, #value1 do
            -- ลูปกลับหลัง เพื่อหาเลขที่ยืมได้
            for j = #value1, 1, -1 do
                -- ถ้า value1 มีค่าน้อยกว่า value2
                if value1[j] < value2[j] and value1[j - 1] > 0 then
                    -- ให้ value1 ไปข้างหน้า 1 เป็น ค่าจาก value1 ไปข้างหน้า 1 ลบด้วย 1
                    value1[j - 1] = value1[j - 1] - 1
                    -- ให้ value1 บวกด้วย 2
                    value1[j] = 2
                end
            end
            --end
        end
    end
end
for k = 1, #value1 do
    -- สำหรับลบค่า
    -- ถ้า value1 มีค่าเท่ากับ value2
    if value1[k] == value2[k] then
        -- เพิ่มค่าใน value3 เป็น 0
        table.insert(value3, 0)
        -- ถ้า value1 มีค่ามากกว่า value2
    elseif value1[k] > value2[k] then
        local temp = value1[k] - value2[k]
        table.insert(value3, temp)
    end
end

-- ลบตัวเลข 0 ออกจากอาร์เรย์จนกว่าจะพบตัวเลขที่ไม่ใช่ 0
while #value3 > 0 and value3[1] == 0 do
    table.remove(value3, 1)
end

printArray(value1, "value 1 after")
printArray(value2, "Value 2 after")
printArray(value3, "answer ")


