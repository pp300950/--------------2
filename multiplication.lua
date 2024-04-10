local value1 = { 1, 1, 0, 1, 0 }
local value2 = { 1, 1, 0 }
local answer = {}
local answer2 = {}

local function printArray(array, message)
    io.write(message .. ": ")
    for i = 1, #array do
        io.write(array[i] .. " ")
    end
    io.write("\n")
end

for i = #value2, 1, -1 do -- วนลูปจากตำแหน่งสุดท้ายของอาร์เรย์
    if value2[i] == 0 then
        table.insert(answer, 0)
    elseif value2[i] == 1 then
        for j = #value2, 1, -1 do
            if value1[j] == 0 then
                table.insert(answer, 0)
            elseif value1[j] == 1 then
                table.insert(answer, 1)
            end
        end
    end

    printArray(answer, "answer 1 ")
end
