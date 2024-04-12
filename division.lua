local function copyBinary(bin)
    local copy = {}
    for i = 1, #bin do
    copy[i] = bin[i]
    end
    return copy
    end
    local function padWithZeros(bin, length)
    while #bin < length do
    table.insert(bin, 1, 0) -- ใส่ 0 ไว้ที่หน้าสุดของ array
    end
    end
    local function binarySubtract(a, b)
    local result = {}
    local borrow = 0
    local bCopy = copyBinary(b)
    padWithZeros(bCopy, #a) -- ใส่ 0 ให้ bCopy มีขนาดเท่ากับ a
    for i = #a, 1, -1 do
    local diff = a[i] - bCopy[i] - borrow
    if diff < 0 then
    diff = diff + 2
    borrow = 1
    else
    borrow = 0
    end
    result[i] = diff
    end
    while #result > 1 and result[1] == 0 do
    table.remove(result, 1)
    end
    return result
    end
    local function canSubtract(a, b)
    if #b > #a then return false end
    if #b < #a then return true end
    for i = 1, #a do
    if a[i] < b[i] then
    return false
    elseif a[i] > b[i] then
    return true
    end
    end
    return true
    end
    local function binaryDivide(dividend, divisor)
    local quotient = {}
    local remainder = copyBinary(dividend)
    for i = 1, #dividend - #divisor + 1 do
    quotient[i] = 0
    end
    for i = #quotient, 1, -1 do
    local shiftedDivisor = copyBinary(divisor)
    for j = 1, #quotient - i do
    table.insert(shiftedDivisor, 1, 0)
    end
    if canSubtract(remainder, shiftedDivisor) then
    remainder = binarySubtract(remainder, shiftedDivisor)
    quotient[i] = 1
    end
    end
    return quotient, remainder
    end
    -- ตัวอย่างการใช้งาน
    local dividend = {1, 0, 1, 0, 1} -- 22 in binary
    local divisor = {1, 1} -- 3 in binary
    local quotient, remainder = binaryDivide(dividend, divisor)
    print("Quotient: ")
    for i = 1, #quotient do
    io.write(quotient[i])
    end
    io.write("\n")
    print("Remainder: ")
    for i = 1, #remainder do
    io.write(remainder[i])
    end
    io.write("\n")