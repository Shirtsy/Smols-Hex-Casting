local args = {...}
local file_path = args[1]

local link = peripheral.find("focal_link")

os.pullEvent("received_iota")

print("Got link!")