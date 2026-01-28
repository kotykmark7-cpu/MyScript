-- [[ TIGER UA - AIMLOCK SYSTEM ]] --

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Настройки
local lockKey = Enum.KeyCode.X
local locking = false
local target = nil

-- Функция поиска ближайшего игрока
local function getClosestPlayer()
    local closest = nil
    local shortestDistance = math.huge

    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closest = v
                shortestDistance = distance
            end
        end
    end
    return closest
end

-- Логика захвата цели
uis.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == lockKey then
        locking = not locking -- Включает/выключает при нажатии
        if locking then
            target = getClosestPlayer()
            if target then
                print("TigerUA: Цель захвачена - " .. target.Name)
            end
        else
            target = nil
            print("TigerUA: Наводка отключена")
        end
    end
end)

-- Постоянное слежение за целью
runService.RenderStepped:Connect(function()
    if locking and target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local cam = workspace.CurrentCamera
        cam.CFrame = CFrame.new(cam.CFrame.Position, target.Character.HumanoidRootPart.Position)
    end
end)

-- Уведомление
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Tiger UA",
    Text = "Нажми X для автонаводки на ближайшего!",
    Duration = 5
})
