-- [[ TIGERCLAW HUB FIXED FINAL ]] --
local success, Library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
end)

if not success or not Library then
    warn("Library failed to load!")
    return
end

local Window = Library.CreateLib("TigerClaw Hub v1.1", "DarkTheme")

-- ПЕРЕМЕННЫЕ
local player = game.Players.LocalPlayer
local flying = false
_G.FlySpeed = 50

-- TECH
local Tech = Window:NewTab("Tech")
local TSec = Tech:NewSection("Supa & Lag")

TSec:NewButton("Activate Supa Tech v2", "Запуск", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Supa-tech-v2-77454"))()
end)

TSec:NewToggle("Fast Lag", "Lag Switch", function(state)
    _G.FLag = state
    spawn(function()
        while _G.FLag do
            settings().Network.IncomingReplicationLag = 1000
            task.wait(0.25)
            settings().Network.IncomingReplicationLag = 0
            task.wait(0.1)
        end
        settings().Network.IncomingReplicationLag = 0
    end)
end)

-- MOVEMENT
local Move = Window:NewTab("Movement")
local MSec = Move:NewSection("Controls")

MSec:NewToggle("Fly", "Полет", function(state)
    flying = state
    local char = player.Character
    if flying and char and char:FindFirstChild("HumanoidRootPart") then
        local bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
        bv.Name = "TFly"
        bv.MaxForce = Vector3.new(1,1,1) * math.huge
        spawn(function()
            while flying do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * _G.FlySpeed
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

MSec:NewSlider("Fly Speed", "Скорость полета", 300, 10, function(s) _G.FlySpeed = s end)
MSec:NewSlider("WalkSpeed", "Бег", 250, 16, function(s) 
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = s 
    end
end)

MSec:NewSlider("JumpPower", "Прыжок", 300, 50, function(p) 
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.UseJumpPower = true
        player.Character.Humanoid.JumpPower = p 
    end
end)

-- SETTINGS
Window:NewTab("Set"):NewSection("UI"):NewKeybind("Close", "R-Ctrl", Enum.KeyCode.RightControl, function() Library:ToggleUI() end)
