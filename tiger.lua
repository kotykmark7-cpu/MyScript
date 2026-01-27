TigerClaw
-- [[ TIGERCLAW HUB - FINAL VERSION 1.1 ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TigerClaw Hub v1.1", "DarkTheme")

-- ПЕРЕМЕННЫЕ
local player = game.Players.LocalPlayer
local flying = false
_G.FlySpeed = 50
_G.FastLag = false

-- ================= ВКЛАДКА: ГЛАВНАЯ =================
local MainTab = Window:NewTab("Главная")
local MainSection = MainTab:NewSection("Статус: Активен")
MainSection:NewLabel("Проект: TigerClaw")
MainSection:NewLabel("Пользователь: Волк")

-- ================= ВКЛАДКА: TECH =================
local TechTab = Window:NewTab("Tech")
local TechSection = TechTab:NewSection("Боевые Модули и Лаги")

-- Кнопка для активации Supa Tech v2
TechSection:NewButton("Activate Supa Tech v2", "Запуск внешнего скрипта Supa", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Supa-tech-v2-77454"))()
end)

-- ФУНКЦИЯ FAST LAG (Lag Switch)
TechSection:NewToggle("Fast Lag (Lag Switch)", "Враги не смогут попасть по тебе", function(state)
    _G.FastLag = state
    spawn(function()
        while _G.FastLag do
            settings().Network.IncomingReplicationLag = 1000 
            task.wait(0.25)
            settings().Network.IncomingReplicationLag = 0
            task.wait(0.1)
        end
        settings().Network.IncomingReplicationLag = 0
    end)
end)

-- ================= ВКЛАДКА: MOVEMENT =================
local MoveTab = Window:NewTab("Movement")
local MoveSection = MoveTab:NewSection("Настройки передвижения")

-- Полет
MoveSection:NewToggle("Fly (Полет)", "Полет в сторону камеры", function(state)
    flying = state
    local char = player.Character
    if flying and char and char:FindFirstChild("HumanoidRootPart") then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "TigerFly"
        bv.velocity = Vector3.new(0, 0, 0)
        bv.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = char.HumanoidRootPart
        
        spawn(function()
            while flying do
                game:GetService("RunService").RenderStepped:Wait()
                if char:FindFirstChild("HumanoidRootPart") then
                    bv.velocity = workspace.CurrentCamera.CFrame.LookVector * _G.FlySpeed
                end
            end
            if bv then bv:Destroy() end
        end)
    end
end)

-- Слайдеры управления
MoveSection:NewSlider("Скорость полета", "Настройка скорости полета", 300, 10, function(s)
    _G.FlySpeed = s
end)

MoveSection:NewSlider("Скорость бега", "Стандарт: 16", 250, 16, function(s)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = s
    end
end)

MoveSection:NewSlider("Высота прыжка", "Стандарт: 50", 300, 50, function(p)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = p
        player.Character.Humanoid.UseJumpPower = true
    end
end)

-- ================= ВКЛАДКА: НАСТРОЙКИ =================
local SettingsTab = Window:NewTab("Настройки")
local SettingsSection = SettingsTab:NewSection("Интерфейс")

SettingsSection:NewKeybind("Скрыть меню", "Правый Ctrl", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)

print("--- TigerClaw Hub v1.1 Загружен! ---")
