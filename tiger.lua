-- [[ TIGERCLAW HUB STABLE ]] --
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
if not Library then 
    warn("Failed to load Library!") 
    return 
end

local Window = Library.CreateLib("TigerClaw Hub v1.1", "DarkTheme")

-- ГЛАВНАЯ
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

-- ДВИЖЕНИЕ
local Move = Window:NewTab("Movement")
local MSec = Move:NewSection("Controls")

MSec:NewToggle("Fly", "Полет", function(state)
    local char = game.Players.LocalPlayer.Character
    if state and char and char:FindFirstChild("HumanoidRootPart") then
        local bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
        bv.Name = "TFly"
        bv.MaxForce = Vector3.new(1,1,1) * math.huge
        spawn(function()
            while state do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

MSec:NewSlider("WalkSpeed", "Бег", 250, 16, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s 
end)

-- НАСТРОЙКИ
Window:NewTab("Set"):NewSection("UI"):NewKeybind("Close", "R-Ctrl", Enum.KeyCode.RightControl, function() Library:ToggleUI() end)
