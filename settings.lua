-- Настройки (отключить музыку), можно что-то добавить еще

local composer = require("composer")
local widget = require("widget")

local scene = composer.newScene()

-- Функция нажатия на кнопку "Назад"
local function goBack(event)
    if (event.phase == "ended") then
        composer.gotoScene("menu", {effect = "fade", time = 500})
    end
end

-- Функция включения/выключения музыки
local function toggleMusic(event)
    if (event.phase == "ended") then
        local switch = event.target
        local isMusicEnabled = switch.isOn
        -- Добавить код отключения музыки
    end
end

function scene:create(event)
    local sceneGroup = self.view
    -- Кнопка "Назад"
    local backButton = widget.newButton({
        width = 100,
        height = 40,
        label = "Назад",
        onEvent = goBack
    })
    backButton.x = display.contentCenterX
    backButton.y = display.contentHeight - 50

    -- Переключатель для музыки
    local musicSwitch = widget.newSwitch({
        style = "onOff",
        initialSwitchState = true, -- Музыка включена
        onEvent = toggleMusic
    })
    musicSwitch.x = display.contentCenterX
    musicSwitch.y = display.contentCenterY

    -- Добавляем в сцену
    sceneGroup:insert(backButton)
    sceneGroup:insert(musicSwitch)
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
