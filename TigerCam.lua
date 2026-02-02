-- [[ TIGER CAM - FREECAM SYSTEM ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger Cam 🎥",
   LoadingTitle = "Запуск режима дрона...",
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
local tempCam = Instance.new("Part", workspace)
tempCam.Anchored = true
tempCam.Transparency = 1
tempCam.CanCollide = false

Tab:CreateToggle({
   Name = "Freecam (Свободная камера)",
   CurrentValue = false,
   Callback = function(Value)
       fcamActive = Value
       if fcamActive then
           tempCam.CFrame = cam.CFrame
           cam.CameraSubject = tempCam
           Rayfield:Notify({Title = "Tiger Cam", Content = "Используй WASD, Q, E для управления камерой!"})
       else
           cam.CameraSubject = player.Character.Humanoid
       end
   end,
})

Tab:CreateSlider({
   Name = "Скорость полета камеры",
   Range = {1, 10},
   Increment = 1,
   CurrentValue = 1,
   Callback = function(Value)
       fcamSpeed = Value
   end,
})

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
