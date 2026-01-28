-- [[ TIGER CLICK TP - МГНОВЕННЫЙ ТЕЛЕПОРТ ]] --

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local userInputService = game:GetService("UserInputService")

-- Настройки
local teleportKey = Enum.KeyCode.Z -- Клавиша активации

print("Tiger TP загружен! Нажми Z, чтобы телепортироваться к курсору.")

-- Функция телепортации
local function teleportToMouse()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        -- Получаем позицию клика + небольшой офсет вверх, чтобы не застрять в текстурах
        local targetPos = mouse.Hit.p + Vector3.new(0, 3, 0)
        character.HumanoidRootPart.CFrame = CFrame.new(targetPos)
    end
end

-- Слежка за нажатием клавиши
userInputService.InputBegan:Connect(function(input, gameProcessed)
    -- Если ты не печатаешь в чате и нажал нужную кнопку
    if not gameProcessed and input.KeyCode == teleportKey then
        teleportToMouse()
    end
end)

-- Визуальное уведомление в консоль (F9) или чат
game.StarterGui:SetCore("SendNotification", {
    Title = "Tiger TP",
    Text = "Нажми 'Z' для телепортации!",
    Duration = 5
})
