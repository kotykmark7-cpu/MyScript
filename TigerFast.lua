-- [[ TIGER FAST - SPEED & RANGE ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger Fast ⚡",
   LoadingTitle = "Загрузка TigerFast...",
   LoadingSubtitle = "by Tiger",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Combat Settings", 4483362458)

-- Переменные для настроек
_G.FastAttack = false
_G.AttackRange = 3.5

Tab:CreateSection("Main Settings")

-- ВКЛЮЧЕНИЕ БЫСТРОЙ АТАКИ
Tab:CreateToggle({
   Name = "Fast Attack (Быстрая атака)",
   CurrentValue = false,
   Flag = "FastAttack",
   Callback = function(Value)
       _G.FastAttack = Value
       spawn(function()
           while _G.FastAttack do
               pcall(function()
                   -- Эмуляция клика для быстрой атаки
                   game:GetService("VirtualUser"):CaptureController()
                   game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
               end)
               task.wait(0.1) -- Задержка между ударами
           end
       end)
   end,
})

-- НАСТРОЙКА ДАЛЬНОСТИ
Tab:CreateSlider({
   Name = "Attack Range (Дальность)",
   Range = {3, 100},
   Increment = 1,
   Suffix = " Studs",
   CurrentValue = 3.5,
   Flag = "RangeSlider",
   Callback = function(Value)
       _G.AttackRange = Value
       -- В большинстве скриптов это влияет на размер хитбокса
       pcall(function()
           local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
           if tool and tool:FindFirstChild("Handle") then
               tool.Handle.Size = Vector3.new(Value, Value, Value)
               tool.Handle.CanCollide = false
           end
       end)
   end,
})

Rayfield:Notify({
    Title = "Tiger Fast Готов!",
    Content = "Настрой дальность и скорость в меню",
    Duration = 5
})
