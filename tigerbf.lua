-- [[ TIGER HUB (BF) - MEGA UPDATE 2026 ]] --
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

local Window = Library.CreateLib("Tiger Hub: BF ULTIMATE", "DarkTheme")

-- ГЛАВНЫЕ ХАБЫ (Здесь работает ВСЁ)
local Main = Window:NewTab("Main Farm")
local MSec = Main:NewSection("Выбери любой хаб (Auto-Farm внутри)")

MSec:NewButton("Zaque Hub (Best Fast Attack)", "Самый быстрый фарм уровней", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Meidu_Sucre/ZaqueHub/main/Zaque%20Hub"))()
end)

MSec:NewButton("Mukuru Hub (Top 2026)", "Стабильный фарм без вылетов", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LOBITS/MukuruHub/main/Start.lua"))()
end)

MSec:NewButton("Hoho Hub (Classic)", "Проверенный временем авто-фарм", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_HUB/main/StartLoad.lua'))()
end)

-- ФРУКТЫ (Roll & Inventory)
local Fruit = Window:NewTab("Fruits")
local FSec = Fruit:NewSection("Работа с фруктами")

FSec:NewButton("Auto Roll Fruit", "Автоматически крутить фрукты", function()
    -- Вызывает меню, где можно настроить авто-ролл
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XERO-HUB/XERO-FREE/main/main.lua"))()
end)

FSec:NewButton("Fruit Inventory UI", "Посмотреть свои фрукты", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetInventoryFruits")
end)

-- ПРИКОЛЫ (Misc)
local Misc = Window:NewTab("Misc")
local MSec2 = Misc:NewSection("Полезные функции")

MSec2:NewButton("Walk On Water (Platform)", "Ходить по воде", function()
    local p = Instance.new("Part", workspace)
    p.Size = Vector3.new(500, 2, 500)
    p.Anchored = true
    p.Transparency = 0.5
    spawn(function()
        while task.wait() do
            p.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, 0, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
        end
    end)
end)

MSec2:NewButton("Infinite Energy", "Бесконечная энергия", function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            game.Players.LocalPlayer.Character.Energy.Value = game.Players.LocalPlayer.Character.Energy.MaxValue
        end)
    end)
end)

-- НАСТРОЙКИ
local Set = Window:NewTab("Settings")
Set:NewSection("Control"):NewKeybind("Toggle UI", "R-Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
