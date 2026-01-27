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
local FSec = Farm:NewSection("Auto Farm & Hubs")

FSec:NewButton("Hoho Hub (Auto-Farm Level)", "Запустить топовый фарм", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_HUB/main/StartLoad.lua'))()
end)

FSec:NewButton("Neva Hub (Best Quest)", "Авто-выполнение квестов", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201nelson/RealScript/main/Neva'))()
end)

-- ВКЛАДКА ФРУКТОВ
local Fruits = Window:NewTab("Fruits")
local FrSec = Fruits:NewSection("Fruit Tools")

FrSec:NewButton("Fruit Finder (ESP)", "Показать фрукты на карте", function()
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Handle") then
            local bill = Instance.new("BillboardGui", v.Handle)
            bill.AlwaysOnTop = true
            bill.Size = UDim2.new(0, 100, 0, 50)
            local text = Instance.new("TextLabel", bill)
            text.Text = v.Name
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.TextColor3 = Color3.new(1, 0, 0)
        end
    end
end)

-- ВКЛАДКА СТАТОВ
local Stats = Window:NewTab("Stats")
local SSec = Stats:NewSection("Auto Stats")

SSec:NewButton("Full Melee Stats", "Макс. ближний бой", function()
    local args = { [1] = "AddPoint", [2] = "Melee", [3] = 100 }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

-- ВКЛАДКА ИГРОКА
local Player = Window:NewTab("Player")
local PSec = Player:NewSection("Movement")

PSec:NewSlider("WalkSpeed", "Скорость бега", 250, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

-- НАСТРОЙКИ
Window:NewTab("Settings"):NewSection("UI"):NewKeybind("Close Menu", "R-Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
