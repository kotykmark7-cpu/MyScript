-- [[ TIGER ULTIMATE HUB - ALL IN ONE ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger Ultimate 🐯",
   LoadingTitle = "Загрузка всех модулей...",
   LoadingSubtitle = "by Tiger",
   ConfigurationSaving = { Enabled = false }
})

-- 1. ВКЛАДКА БОЯ (FAST ATTACK & RANGE)
local CombatTab = Window:CreateTab("Combat/Farm", 4483362458)

_G.FastAttack = false
_G.AttackRange = 3.5

CombatTab:CreateToggle({
   Name = "Fast Attack (Ультра)",
   CurrentValue = false,
   Callback = function(Value)
       _G.FastAttack = Value
       task.spawn(function()
           while _G.FastAttack do
               pcall(function()
                   game:GetService("VirtualUser"):CaptureController()
                   game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
               end)
               task.wait(0.05)
           end
       end)
   end,
})

CombatTab:CreateSlider({
   Name = "Attack Range (Хитбокс)",
   Range = {3, 100},
   Increment = 1,
   CurrentValue = 3.5,
   Callback = function(Value)
       _G.AttackRange = Value
       pcall(function()
           local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
           if tool and tool:FindFirstChild("Handle") then
               tool.Handle.Size = Vector3.new(Value, Value, Value)
               tool.Handle.CanCollide = false
           end
       end)
   end,
})

-- 2. ВКЛАДКА ТЕЛЕПОРТОВ (ИЗ ТВОЕГО ЗАПРОСА)
local TPTab = Window:CreateTab("Teleports", 4483345998)

TPTab:CreateButton({
   Name = "Teleport to Fruit (К фрукту)",
   Callback = function()
       local fruit = workspace:FindFirstChildOfClass("Tool") or workspace:FindFirstChild("Handle")
       if fruit and fruit.Name:find("Fruit") then
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame
       end
   end,
})

-- 3. ВКЛАДКА МОЩНЫХ ХАБОВ (ВСЕ ФУНКЦИИ МИРА)
local HubsTab = Window:CreateTab("External Hubs", 4483362458)

HubsTab:CreateSection("Если нужно БОЛЬШЕ функций:")

HubsTab:CreateButton({
   Name = "Redz Hub (Best Mobile)",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzHub/main/Player.lua"))()
   end,
})

HubsTab:CreateButton({
   Name = "Hoho Hub (Auto Farm Level)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_GUI'))()
   end,
})

-- 4. ВКЛАДКА ИГРОКА
local PlayerTab = Window:CreateTab("Player", 4483345998)

PlayerTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateButton({
   Name = "Infinity Jump (Беск. прыжки)",
   Callback = function()
       game:GetService("UserInputService").JumpRequest:Connect(function()
           game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
       end)
   end,
})
