-- [[ TIGER HUB (BF) - REPAIRED & WORKING 2026 ]] --
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

local Window = Library.CreateLib("Tiger Hub: BF REPAIRED", "DarkTheme")

-- ГЛАВНЫЙ ФАРМ (Здесь всё рабочее)
local Main = Window:NewTab("Main Farm")
local MSec = Main:NewSection("Рабочие Хабы (Fast Attack внутри)")

MSec:NewButton("REDZ HUB (Лучший сейчас)", "Авто-фарм, Фаст атака, Статы", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzHub/main/Player.lua"))()
end)

MSec:NewButton("ALCHEMY HUB V3", "Очень быстрый фарм уровней", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Clutch_Doge/AlchemyHub/main/Main.lua"))()
end)

-- ПРИКОЛЮХИ (Misc)
local Misc = Window:NewTab("Misc")
local MSec2 = Misc:NewSection("Способности и Мир")

MSec2:NewButton("Walk On Water (FIXED)", "Ходить по воде (нажми один раз)", function()
    local pw = Instance.new("Part", workspace)
    pw.Name = "TigerWater"
    pw.Size = Vector3.new(100, 2, 100)
    pw.Transparency = 1
    pw.Anchored = true
    game:GetService("RunService").RenderStepped:Connect(function()
        pw.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 0.5, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
    end)
end)

MSec2:NewButton("Infinite Energy", "Бесконечная энергия", function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            game.Players.LocalPlayer.Character.Energy.Value = game.Players.LocalPlayer.Character.Energy.MaxValue
        end)
    end)
end)

-- ФРУКТЫ (Sniper & Finder)
local Fruit = Window:NewTab("Fruits")
local FSec = Fruit:NewSection("Работа с фруктами")

FSec:NewButton("Fruit Finder (ESP)", "Показать фрукты на сервере", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IratuServices/PlayerESP/main/ESP.lua"))() -- Используем универсальный ESP
end)

FSec:NewButton("Auto Buy Fruits", "Магазин (Sniper)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditibi/bf/main/fruit"))()
end)

-- ПЕРСОНАЖ
local Ply = Window:NewTab("Player")
local PSec = Ply:NewSection("Скорость и прыжки")

PSec:NewSlider("Speed", "Скорость бега", 250, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PSec:NewSlider("Jump", "Высота прыжка", 300, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- НАСТРОЙКИ
local Set = Window:NewTab("Settings")
Set:NewSection("Управление"):NewKeybind("Закрыть Меню", "R-Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
