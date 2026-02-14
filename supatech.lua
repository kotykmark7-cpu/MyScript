local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7Lib/UI-Library/main/Source.lua"))() -- Простая библиотека для GUI

local Window = Library.CreateLib("TSB Combo Script", "DarkTheme")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Combo Settings")

local enabled = false
local clickCount = 0

Section:NewToggle("Включить Авто-Дэш", "Включает комбо после 4 удара", function(state)
    enabled = state
    clickCount = 0
end)

-- Логика отслеживания кликов
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()
    if not enabled then return end
    
    clickCount = clickCount + 1
    
    -- Сбрасываем счетчик, если пауза между кликами слишком большая (больше 1.5 сек)
    task.delay(1.5, function()
        if clickCount > 0 then clickCount = 0 end
    end)

    -- Если это 4-й удар (подброс вверх)
    if clickCount == 4 then
        task.wait(0.1) -- Небольшая задержка, чтобы анимация началась
        
        -- Прыгаем вместе с противником
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        
        -- Авто-дэш (имитация нажатия Q)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Q, false, game)
        
        clickCount = 0 -- Обнуляем после комбо
    end
end)
