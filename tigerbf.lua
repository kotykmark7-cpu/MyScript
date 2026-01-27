-- [[ TIGER HUB (BF) - 100% WORKING VERSION ]] --
local function LoadLib()
    local success, res = pcall(game.HttpGet, game, "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua")
    if success then return loadstring(res)() end
    return loadstring(game:HttpGet("https://pastebin.com/raw/vpfSeZ9m"))()
end

local Library = LoadLib()
local Window = Library.CreateLib("Tiger Hub: BF FIXED", "DarkTheme")

-- ГЛАВНАЯ ВКЛАДКА
local Main = Window:NewTab("Main")
local MSec = Main:NewSection("Universal Blox Fruits Scripts")

MSec:NewButton("REDZ HUB (AUTO-FARM & ROLL)", "Самый рабочий на сегодня", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzHub/main/Player.lua"))()
end)

MSec:NewButton("W-AZURE (FULL HUB)", "Если Redz не открылся", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf533361b695d18ddc4d6718d9.lua"))()
end)

-- ПРИКОЛЫ
local Misc = Window:NewTab("Misc")
local MSec2 = Misc:NewSection("Player Tools")

MSec2:NewSlider("Speed", "Скорость", 250, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MSec2:NewButton("Inf Energy", "Беск. Энергия", function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function() game.Players.LocalPlayer.Character.Energy.Value = 10000 end)
    end)
end)

-- НАСТРОЙКИ
Window:NewTab("Settings"):NewSection("UI"):NewKeybind("Close", "R-Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
