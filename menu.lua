-- Главное меню

local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()

-- Функция нажатия на кнопку "Начать игру"
local function startGame(event)
    if (event.phase == "ended") then
        -- Переход к сцене первого уровня игры
        composer.gotoScene("levelone", {effect = "fade", time = 500})
    end
end

-- Функция нажатия на кнопку "Выбор уровней"
local function levelSelection(event)
    if (event.phase == "ended") then
        -- Переход к сцене выбора уровней
        composer.gotoScene("levelSelection", {effect = "fade", time = 500})
    end
end

-- Функция нажатия на кнопку "Настройки"
local function settings(event)
    if (event.phase == "ended") then
        -- Переход к сцене настроек
        composer.gotoScene("settings", {effect = "fade", time = 500})
    end
end

function scene:create(event)
    local sceneGroup = self.view

    -- Создание кнопки "Начать игру"
    local startButton = widget.newButton({
        width = 200,
        height = 40,
        label = "Начать игру",
        onEvent = startGame
    })
    startButton.x = display.contentCenterX
    startButton.y = display.contentCenterY - 60

    -- Создание кнопки "Выбор уровней"
    local levelButton = widget.newButton({
        width = 200,
        height = 40,
        label = "Выбор уровней",
        onEvent = levelSelection
    })
    levelButton.x = display.contentCenterX
    levelButton.y = display.contentCenterY

    -- Создание кнопки "Настройки"
    local settingsButton = widget.newButton({
        width = 200,
        height = 40,
        label = "Настройки",
        onEvent = settings
    })
    settingsButton.x = display.contentCenterX
    settingsButton.y = display.contentCenterY + 60

    -- Добавили кнопки в сцену
    sceneGroup:insert(startButton)
    sceneGroup:insert(levelButton)
    sceneGroup:insert(settingsButton)
end

-- Показать сцену
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
    elseif (phase == "did") then
    end
end

-- Скрыть сцену
function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
    elseif (phase == "did") then
    end
end

function scene:destroy(event)
    local sceneGroup = self.view
end

-- Обработчики событий
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
