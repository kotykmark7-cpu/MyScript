-- [[ TIGER FAST - ULTIMATE FARMLIST ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger Ultimate 🐯",
   LoadingTitle = "Скрипт от Tiger",
   LoadingSubtitle = "by Tiger",
   ConfigurationSaving = { Enabled = false }
})

local FarmTab = Window:CreateTab("Auto Farm", 4483362458)

FarmTab:CreateSection("Мощные фармилки (как Gravity Hub)")

FarmTab:CreateButton({
   Name = "ЗАПУСТИТЬ AUTO-FARM (Gravity Method)",
   Callback = function()
       -- Это база того самого скрипта, который ты просил
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua"))()
   end,
})

FarmTab:CreateButton({
   Name = "Redz Hub (Лучший для мобилок)",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzHub/main/Player.lua"))()
   end,
})

local CombatTab = Window:CreateTab("Combat Extras", 4483362458)

CombatTab:CreateToggle({
   Name = "Fast Attack (Speed X2)",
   CurrentValue = false,
   Callback = function(Value)
       _G.FastAttack = Value
       spawn(function()
           while _G.FastAttack do
               pcall(function()
                   game:GetService("VirtualUser"):CaptureController()
                   game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
               end)
               task.wait(0.01)
           end
       end)
   end,
})

CombatTab:CreateSlider({
   Name = "Attack Range (Дальность)",
   Range = {3, 100},
   Increment = 1,
   CurrentValue = 3.5,
   Callback = function(Value)
       pcall(function()
           local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
           if tool and tool:FindFirstChild("Handle") then
               tool.Handle.Size = Vector3.new(Value, Value, Value)
               tool.Handle.CanCollide = false
           end
       end)
   end,
})
