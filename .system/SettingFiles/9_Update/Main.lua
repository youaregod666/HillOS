local GUI = require("GUI")
local text = require("Text")
local filesystem = require("Filesystem")
local paths = require("Paths")
local system = require("System")
local fs = require("Filesystem")
local image = require("Image")
local SHA = require("SHA-256")
local component = require("Component")
local EFI = component.eeprom
local internet = require("Internet")

local module = {}

local workspace, window, localization = table.unpack({...})
local userSettings = system.getUserSettings()

--------------------------------------------------------------------------------

module.name = "Update"
module.margin = 3
module.onTouch = function()

	local function addButton(parent, x, width, ...)
		local button = parent:addChild(GUI.button(x, 1, width, 3, 0xE1E1E1, 0x696969, 0x696969, 0xE1E1E1, ...))
		button.colors.disabled = {
			background = 0xE1E1E1,
			text = 0xB4B4B4
		}

		return button
	end


	window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "HillOS Updater"))

	local iconButton = addButton(window.contentLayout, 1, 36, "Update")
	--local wallpaperSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Update Settings", false))
	--local efiSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Update BIOS", false))

	local function replaceloader()
		-- Checks if a Backup folder exists and if it does then. It's deleted
		if fs.exists("/Backup") then
			fs.remove("/Backup")
			fs.makeDirectory("/Backup")
		else
			fs.makeDirectory("/Backup")
		end

		fs.copy("/.system/Libraries/", "/Backup/.system/Libraries/")
		fs.remove("/.system/Libraries/")
		fs.makeDirectory("/.system/Libraries")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/BigLetters.lua", "/.system/Libraries/BigLetters.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Bit32.lua", "/.system/Libraries/Bit32.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Color.lua", "/.system/Libraries/Color.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Component.lua", "/.system/Libraries/Component.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Compressor.lua", "/.system/Libraries/Compressor.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Event.lua", "/.system/Libraries/Event.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Filesystem.lua", "/.system/Libraries/Filesystem.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/GUI.lua", "/.system/Libraries/GUI.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Image.lua", "/.system/Libraries/Image.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Internet.lua", "/.system/Libraries/Internet.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/JSON.lua", "/.system/Libraries/JSON.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Keyboard.lua", "/.system/Libraries/Keyboard.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Network.lua", "/.system/Libraries/Network.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Number.lua", "/.system/Libraries/Number.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Paths.lua", "/.system/Libraries/Paths.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/SHA-256.lua", "/.system/Libraries/SHA-256.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Screen.lua", "/.system/Libraries/Screen.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/System_With_Dock.lua", "/.system/Libraries/System_With_Dock.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Text.lua", "/.system/Libraries/Text.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/.system/Libraries/Vector.lua", "/.system/Libraries/Vector.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/Programs/Settings.app/Modules/9_Update/Main.lua", "/Programs/Settings.app/Modules/9_Update/Main.lua")
		internet.download("https://raw.githubusercontent.com/youaregod666/HillOS/refs/heads/rev_LittleVally/Programs/Settings.app/Modules/9_Update/Icon.pic", "/Programs/Settings.app/Modules/9_Update/Icon.pic")

		computer.shutdown(true)
	end

		window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Make a Backup"))
	iconButton.onTouch = function()
		replaceloader()
	end
	--space:draw()
	local iconButton2 = addButton(window.contentLayout, 1, 36, "Remove Backup")
	iconButton2.onTouch = function()
		if fs.exists("/Backup") then
			fs.remove("/Backup")
		else
			GUI.alert("No Backup Folder")
		end
	end
	local iconButton3 = addButton(window.contentLayout, 1, 36, "Restore past version")
	iconButton3.onTouch = function()
		if fs.exists("/Backup") then
			fs.remove("/.system/Libraries/")
			fs.copy("/Backup/", "/")
		else
			GUI.alert("No Backup Folder")
		end
	end

end

--------------------------------------------------------------------------------

return module

