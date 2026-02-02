-- [[ TIGER CAM - Z KEY FREECAM ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger Cam 🎥",
   LoadingTitle = "Режим разведки...",
   LoadingSubtitle = "by Tiger",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Камера", 4483362458)

local cam = workspace.CurrentCamera
local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")
local uis = game:GetService("UserInputService")

local fcamActive = false
local fcamSpeed = 1
local tempCam = Instance.new("Part")
tempCam.Name = "TigerCamPart"
tempCam.Parent = workspace
tempCam.Anchored = true
tempCam.Transparency = 1
tempCam.CanCollide = false

-- Функция переключения камеры
local function toggleFreecam()
    fcamActive = not fcamActive
    if fcamActive then
        tempCam.CFrame = cam.CFrame
        cam.CameraSubject = tempCam
        Rayfield:Notify({Title = "Tiger Cam", Content = "Свободная камера: ВКЛ (Управление: WASD + Q/E)", Duration = 2})
    else
        cam.CameraSubject = player.Character:FindFirstChild("Humanoid")
        Rayfield:Notify({Title = "Tiger Cam", Content = "Свободная камера: ВЫКЛ", Duration = 2})
    end
end

-- Переключатель в меню
Tab:CreateToggle({
   Name = "Freecam (Клавиша Z)",
   CurrentValue = false,
   Callback = function(Value)
       if fcamActive ~= Value then
           toggleFreecam()
       end
   end,
})

-- Слайдер скорости
Tab:CreateSlider({
   Name = "Скорость камеры",
   Range = {1, 20},
   Increment = 1,
   CurrentValue = 1,
   Callback = function(Value)
       fcamSpeed = Value
   end,
})

-- ОТСЛЕЖИВАНИЕ КЛАВИШИ Z
uis.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.Z then
        toggleFreecam()
    end
end)

-- ДВИЖЕНИЕ КАМЕРЫ
runService.RenderStepped:Connect(function()
    if fcamActive then
        local moveDir = Vector3.new(0,0,0)
        if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.E) then moveDir = moveDir + Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.Q) then moveDir = moveDir - Vector3.new(0,1,0) end
        
        tempCam.CFrame = tempCam.CFrame + (moveDir * fcamSpeed)
    end
end)
