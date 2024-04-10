local value1 = 13
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

 -- ลบตัวเลข 0 ออกจากอาร์เรย์จนกว่าจะพบตัวเลขที่ไม่ใช่ 0
 while #answer > 0 and answer[1] == 0 do
    table.remove(answer, 1)
end

print(value1)
for i = 1, #answer do
    io.write(answer[i] .. " ")
end
io.write("\n")