local Internet = require("Internet")
local Filesystem = require("Filesystem")
local System = require("System")
local Branch = "Dev_LongCopenhagen"

-- Creates an Backup
if Filesystem.exists("/Backup") then
    Filesystem.remove("/Backup")
    Filesystem.makeDirectory("/Backup")
else
    Filesystem.makeDirectory("/Backup")
end
Filesystem.copy("/.system/Libraries/", "/Backup/.system/Libraries/")
Filesystem.remove("/.system/Libraries/")

-- Installs the update
Filesystem.makeDirectory("/.system/Libraries")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/BigLetters.lua", "/.system/Libraries/BigLetters.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Bit32.lua", "/.system/Libraries/Bit32.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Color.lua", "/.system/Libraries/Color.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Component.lua", "/.system/Libraries/Component.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Compressor.lua", "/.system/Libraries/Compressor.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Event.lua", "/.system/Libraries/Event.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Filesystem.lua", "/.system/Libraries/Filesystem.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/GUI.lua", "/.system/Libraries/GUI.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Image.lua", "/.system/Libraries/Image.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Internet.lua", "/.system/Libraries/Internet.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/JSON.lua", "/.system/Libraries/JSON.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Keyboard.lua", "/.system/Libraries/Keyboard.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Network.lua", "/.system/Libraries/Network.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Number.lua", "/.system/Libraries/Number.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Paths.lua", "/.system/Libraries/Paths.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/SHA-256.lua", "/.system/Libraries/SHA-256.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Screen.lua", "/.system/Libraries/Screen.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/System_With_Dock.lua", "/.system/Libraries/System_With_Dock.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Text.lua", "/.system/Libraries/Text.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/Vector.lua", "/.system/Libraries/Vector.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/MeowEngine/Main.lua", "/.system/Libraries/MeowEngine/Main.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/OpenComputersGL/Main.lua", "/.system/Libraries/OpenComputersGL/Main.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/OpenComputersGL/Materials.lua", "/.system/Libraries/OpenComputersGL/Materials.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/Libraries/OpenComputersGL/Renderer.lua", "/.system/Libraries/OpenComputersGL/Renderer.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/SettingFiles/9_Update/Main.lua", "/.system/SettingFiles/9_Update/Main.lua")
Internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/" .. Branch .. "/.system/SettingFiles/9_Update/Icon.pic", "/.system/SettingFiles/9_Update/Icon.pic")
