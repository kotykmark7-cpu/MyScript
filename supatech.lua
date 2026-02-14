--[[
    Supa Combo Assistant (TSB)
    Функционал: 3 клика + 4-й (вверх) + авто-прыжок и дэш
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Supa Tech Lite", "BloodTheme")
local Main = Window:NewTab("Main")
local Section = Main:NewSection("Combo Settings")

local autoUpEnabled = false
local hitCounter = 0
local lastHitTime = 0

Section:NewToggle("Auto Up-Combo", "3 Hits + 4th Lift + Auto Dash", function(state)
    autoUpEnabled = state
    hitCounter = 0
end)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local vim = game:GetService("VirtualInputManager")

-- Функция для выполнения прыжка и дэша
local function performUpCombo()
    task.wait(0.15) -- Тайминг подброса (подстрой под пинг)
    
    -- Прыжок
    character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    
    task.wait(0.1)
    
    -- Эмуляция нажатия кнопки Q (Дэш)
    vim:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
    task.wait(0.05)
    vim:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
end

-- Отслеживание кликов мыши
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe or not autoUpEnabled then return end
    
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local currentTime = tick()
        
        -- Если прошло больше 1.2 сек, сбрасываем счетчик (комбо прервано)
        if currentTime - lastHitTime > 1.2 then
            hitCounter = 0
        end
        
        hitCounter = hitCounter + 1
        lastHitTime = currentTime
        
        -- На 4-м клике запускаем логику подъема
        if hitCounter == 4 then
            performUpCombo()
            hitCounter = 0 -- Сброс после выполнения
        end
    end
end)

print("Supa Tech Lite загружен!")
