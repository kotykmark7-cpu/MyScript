-- [[ TIGER INF - GHOST & FLY MODE ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tiger INF 👻",
   LoadingTitle = "Запуск режима Призрака...",
   LoadingSubtitle = "by Tiger",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Movement", 4483362458)

_G.Noclip = false

-- КНОПКА: ПРОХОД СКВОЗЬ СТЕНЫ
Tab:CreateToggle({
   Name = "Noclip (Сквозь стены)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Noclip = Value
   end,
})

-- КНОПКА: БЕСКОНЕЧНЫЕ ПРЫЖКИ
Tab:CreateButton({
   Name = "Infinite Jump (Беск. прыжки)",
   Callback = function()
       local Player = game:GetService("Players").LocalPlayer
       game:GetService("UserInputService").JumpRequest:Connect(function()
           Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
       end)
       Rayfield:Notify({Title = "Tiger INF", Content = "Теперь ты можешь прыгать в воздухе!"})
   end,
})

-- Логика прохода сквозь стены
game:GetService("RunService").Stepped:Connect(function()
    if _G.Noclip then
        if game.Players.LocalPlayer.Character then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

Rayfield:Notify({Title = "Tiger INF Загружен", Content = "Используй Noclip, чтобы проходить сквозь стены"})
