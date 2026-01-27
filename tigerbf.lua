-- [[ TIGER HUB (BF) ULTIMATE EDITION ]] --
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

local Window = Library.CreateLib("Tiger Hub: Blox Fruits ELITE", "DarkTheme")

-- ГЛАВНЫЙ ФАРМ (ДЕНЬГИ И УРОВНИ)
local Main = Window:NewTab("Main Farm")
local MSec = Main:NewSection("Money & Level Farm")

MSec:NewButton("Redz Hub (Best for Beli)", "Лучший фарм денег и уровней", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzHub/main/Player.lua"))()
end)

MSec:NewButton("W-Azure Hub", "Очень много функций фарма", function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf533361b695d18ddc4d6718d9.lua"))()
end)

-- АВТО-ИВЕНТЫ
local Events = Window:NewTab("Events")
local ESec = Events:NewSection("Auto Events & Sea")

ESec:NewButton("Auto Sea Events", "Авто-ивенты в море", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XeroHub/XeroHub/main/main.lua"))()
end)

ESec:NewButton("Mirage Island Finder", "Поиск острова Мираж", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xtrey10x/xtrey10x/main/solaris.lua"))()
end)

-- БОЕВЫЕ ФУНКЦИИ И ВОДА
local Combat = Window:NewTab("Combat & Misc")
local CSec = Combat:NewSection("Abilities")

CSec:NewToggle("Walk On Water", "Ходить по воде", function(state)
    _G.WaterWalk = state
    spawn(function()
        while _G.WaterWalk do
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                if game.Players.LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Water then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end
            end
            task.wait()
        end
    end)
end)

CSec:NewButton("No Water Damage", "Вода не бьет", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonShip") -- Баг на бессмертие в воде
end)

CSec:NewButton("Infinite Energy", "Бесконечная энергия", function()
    game:GetService("RunService").RenderStepped:Connect(function()
        game.Players.LocalPlayer.Character.Energy.Value = game.Players.LocalPlayer.Character.Energy.MaxValue
    end)
end)

-- АВТО-СТАТЫ
local Stats = Window:NewTab("Stats")
local SSec = Stats:NewSection("Auto Update Stats")

SSec:NewButton("Add Points: Melee", "Все очки в ближний бой", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Melee", 100)
end)

SSec:NewButton("Add Points: Defense", "Все очки в защиту", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", "Defense", 100)
end)

-- НАСТРОЙКИ
local Set = Window:NewTab("Settings")
Set:NewSection("Control"):NewKeybind("Toggle UI", "R-Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
