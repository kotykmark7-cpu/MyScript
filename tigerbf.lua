-- [[ TIGER HUB (BF) - EMERGENCY FIX ]] --

print("Tiger Hub Loading...")

-- Сразу запускаем самый мощный хаб, минуя все меню, чтобы проверить работу
-- Этот хаб сам создаст интерфейс, в котором работает ВСЁ (Фарм, Ролл, Море)

local function Start()
    -- Попытка запустить Redz (он самый надежный)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzHub/main/Player.lua"))()
    
    -- Если через 5 секунд ничего не появилось, запускаем запасной Banana Hub
    task.wait(5)
    
    if not game:GetService("CoreGui"):FindFirstChild("redz3library") then
        warn("Redz failed, loading Banana Hub...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RimuruWorkshop/BananaHub/main/BananaHub.lua"))()
    end
end

pcall(Start)

-- Дополнительная кнопка в консоль (нажми F9 в игре чтобы увидеть)
print("--- TIGER HUB LOADED ---")
print("Если меню не появилось, попробуй еще раз или смени сервер!")
