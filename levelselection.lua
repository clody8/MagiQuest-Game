-- Выбор уровней

local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()

-- Функция нажатия на кнопку "Назад"
local function goBack(event)
    if (event.phase == "ended") then
        composer.gotoScene("menu", {effect = "fade", time = 500})
    end
end

-- Функция нажатия на кнопку выбора уровня
local function selectLevel(event)
    if (event.phase == "ended") then
        local target = event.target
        local level = target.level
        -- Переход к выбранному уровню
        composer.gotoScene("level" .. level, {effect = "fade", time = 500})
    end
end

function scene:create(event)
    local sceneGroup = self.view

    local backButton = widget.newButton({
        width = 100,
        height = 40,
        label = "Назад",
        onEvent = goBack
    })
    backButton.x = display.contentCenterX
    backButton.y = display.contentHeight - 50

    -- Создание кнопок выбора уровня
    local levelOneButton = widget.newButton({
        width = 200,
        height = 40,
        label = "Уровень 1",
        onEvent = selectLevel
    })
    levelOneButton.x = display.contentCenterX
    levelOneButton.y = display.contentCenterY - 60
    levelOneButton.level = "one" -- Уровень 1

    local levelTwoButton = widget.newButton({
        width = 200,
        height = 40,
        label = "Уровень 2",
        onEvent = selectLevel
    })
    levelTwoButton.x = display.contentCenterX
    levelTwoButton.y = display.contentCenterY
    levelTwoButton.level = "two" -- Уровень 2

    local levelThreeButton = widget.newButton({
        width = 200,
        height = 40,
        label = "Уровень 3",
        onEvent = selectLevel
    })
    levelThreeButton.x = display.contentCenterX
    levelThreeButton.y = display.contentCenterY + 60
    levelThreeButton.level = "three" -- Уровень 3

    -- Добавляем в сцену
    sceneGroup:insert(backButton)
    sceneGroup:insert(levelOneButton)
    sceneGroup:insert(levelTwoButton)
    sceneGroup:insert(levelThreeButton)
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
    elseif (phase == "did") then
    end
end

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

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
