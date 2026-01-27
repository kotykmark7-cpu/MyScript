-- [[ TIGER HUB (BF) - BLOX FRUITS EDITION ]] --
local function LoadLib()
    local sources = {
        "https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua",
        "https://pastebin.com/raw/vpfSeZ9m"
    }
    for _, url in ipairs(sources) do
        local success, res = pcall(game.HttpGet, game, url)
        if success and res then
            local func = loadstring(res)
            if func then return func() end
        end
    end
end

local Library = LoadLib()
if not Library then return end

local Window = Library.CreateLib("Tiger Hub: Blox Fruits", "DarkTheme")

-- ВКЛАДКА ФАРМА
local Farm = Window:NewTab("Main Farm")
local FSec = Farm:NewSection("Auto Farm")

FSec:NewButton("Hoho Hub (Best for BF)", "Запустить топовый фарм", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_HUB/main/StartLoad.lua'))()
end)

FSec:NewButton("Neva Hub", "Мощный авто-фарм уровней", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201nelson/RealScript/main/Neva'))()
end)

-- ВКЛАДКА ИГРОКА
local Player = Window:NewTab("Player")
local PSec = Player:NewSection("Movement")

PSec:NewSlider("WalkSpeed", "Скорость бега", 250, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PSec:NewSlider("JumpPower", "Высота прыжка", 300, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- ВКЛАДКА ТЕЛЕПОРТОВ
local Tele = Window:NewTab("Teleport")
local TSec = Tele:NewSection("World")

TSec:NewButton("Safe Place (Sea 1/2/3)", "ТП в безопасное место", function()
    print("Teleporting...")
    -- Здесь можно добавить свои координаты
end)

-- НАСТРОЙКИ
Window:NewTab("Settings"):NewSection("UI"):NewKeybind("Close Menu", "R-Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
