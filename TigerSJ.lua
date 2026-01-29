-- [[ TIGER JUMP & SPEED HUB ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger Power ⚡",
   LoadingTitle = "Настройка физики...",
   LoadingSubtitle = "by Tiger",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Характеристики", 4483362458)

Tab:CreateSection("Настройка движения")

-- СЛАЙДЕР СКОРОСТИ
Tab:CreateSlider({
   Name = "Скорость бега (WalkSpeed)",
   Range = {16, 500},
   Increment = 1,
   Suffix = " Спид",
   CurrentValue = 16,
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- СЛАЙДЕР ВЫСОТЫ ПРЫЖКА
Tab:CreateSlider({
   Name = "Высота прыжка (JumpPower)",
   Range = {50, 1000},
   Increment = 1,
   Suffix = " Сила",
   CurrentValue = 50,
   Callback = function(Value)
       local hum = game.Players.LocalPlayer.Character.Humanoid
       hum.UseJumpPower = true -- Включаем ручную настройку силы
       hum.JumpPower = Value
   end,
})

Tab:CreateButton({
   Name = "Сбросить настройки",
   Callback = function()
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
       Rayfield:Notify({Title = "Tiger", Content = "Настройки сброшены!"})
   end,
})

Rayfield:Notify({Title = "Tiger Power Загружен", Content = "Теперь ты самый быстрый!"})
