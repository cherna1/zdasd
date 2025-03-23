local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Задаем координаты приманки
local lurePosition = Vector3.new(1505, 939, 0)  -- Замените Z на нужное значение, если необходимо

-- Функция для телепортации к приманке
local function teleportToLure()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(lurePosition)
    else
        warn("Персонаж не найден!")
    end
end

-- Функция для использования приманки и добавления предмета
local function useLure()
    teleportToLure()
    wait(1)  -- Ждем, чтобы телепортация завершилась

    -- Используем приманку
    -- Здесь предполагается, что приманка активируется кликом мыши
    mouse:Click()  -- Клик для активации приманки
    wait(1)  -- Ждем, чтобы приманка активировалась

    -- Используем предмет Shiver cone bait
    local backpack = player:WaitForChild("Backpack")
    local bait = backpack:FindFirstChild("Shiver cone bait")

    if bait then
        bait.Parent = player.Character  -- Перемещаем предмет в персонажа
        wait(0.5)  -- Ждем, чтобы предмет был в инвентаре
        -- Нажимаем 'E' для использования приманки
        local userInputService = game:GetService("User InputService")
        userInputService.InputBegan:Wait()  -- Ждем нажатия клавиши
        userInputService.InputBegan:Fire(userInputService.InputBegan)  -- Эмулируем нажатие 'E'
    else
        warn("Shiver cone bait не найден в инвентаре.")
    end
end

-- Основной цикл
while true do
    useLure()
    wait(4 * 60 * 60)  -- Ждем 4 часа (4 * 60 минут * 60 секунд)
end
