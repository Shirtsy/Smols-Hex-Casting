local args = {...}
local file_path = args[1]

local link = peripheral.find("focal_link")

-- Wait to receive an iota
os.pullEvent("received_iota")

local file = fs.open(file_path, "r")

local line = true
while line do
    local pattern_list = {} 
    for i=1,100  do
        line = file.readLine()
        if line then
            local pattern = {
                ["startDir"] = "WEST",
                ["angles"] = line
            }
            table.insert(pattern_list, pattern)
            print("Inserted:",line)
        else
            break
        end
    end
    link.sendIota(0, pattern_list)
    print("Sending Iota...")
    sleep(0.2)
end