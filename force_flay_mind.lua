local args = {...}
local file_path = args[1]

local link = peripheral.find("focal_link")

local file = fs.open(file_path, "r")

local line = true
while line do
    local pattern_list = {} 
    for i=1,500  do
        line = file.readLine()
        if line then
            local pattern = {
                ["startDir"] = "WEST",
                ["angles"] = line
            }
            table.insert(pattern_list, pattern)
        else
            break
        end
    end
    link.sendIota(0, pattern_list)
    sleep(0.2)
end