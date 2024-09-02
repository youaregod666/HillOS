
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
local internet = require("internet")

local module = {}

local workspace, window, localization = table.unpack({...})
local userSettings
userSettings = system.getUserSettings()

--------------------------------------------------------------------------------

module.name = "Dev Tools"
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

  local function flashEFI(url)
    internet.download(url, "/tempEFI.lua")
    EFI.set(fs.read("/tempEFI.lua"))
    EFI.setLabel("HillOS BIOS")
    fs.remove("/tempEFI.lua")
  end
  local Shitything = "False"
  if system.tabletmode == true then
    Shitything = "True"
  else
    Shitything = "False"
  end
  --local ssg = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Tablet Mode: " .. Shitything))

  local ss = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Dev Tools"))
  --ss()
  --internet.download("URL HERE", "PATH HERE")
  local iconButton = addButton(window.contentLayout, 1, 36, "Change Dev settings")
  local SMODthing
  if userSettings.SMode == "1" then
  SMODthing = true
  else
  SMODthing = false
  end
  local wallpaperSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "HillOS S mode", SMODthing)).switch
  local efiSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "EFI setting", userSettings.EFI)).switch
  local hidefilesSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Show Hidden Files", userSettings.filesShowHidden)).switch
  local TabletSw = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 25, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "Tablet Mode", system.tabletmode)).switch
  TabletSw.onStateChanged = function()
    system.tabletmode = TabletSw.state

  end
  local ss = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Make by Sebastian"))
  if userSettings.EFI == true then
  efiSwitch.state = true
  end
  if userSettings.filesShowHidden == true then
  hidefilesSwitch.state = true
  end

  local function replaceloader()
  if  wallpaperSwitch.state == true then
  userSettings.SMode = "1"
  else
  userSettings.SMode = "0"
  end
  if  efiSwitch.state == true then
  userSettings.EFI = true
  else
  userSettings.EFI = false
  end
  --.switch
  if  hidefilesSwitch.state == true then
  userSettings.filesShowHidden = true
  else
  userSettings.filesShowHidden = false
  end
  system.saveUserSettings()
  end


  iconButton.onTouch = function()
  replaceloader()
  end
  --space:draw()





  --fs.remove("/Libraries/" .. text .. ".lua")
  --fs.rename("/Libraries/" .. text ..".lua", "/OS__.lua")
  end
--------------------------------------------------------------------------------

return module

