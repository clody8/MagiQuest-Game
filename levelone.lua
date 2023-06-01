-- Первый уровень

local composer = require("composer")
local physics = require("physics")

local scene = composer.newScene()

local player
local isJumping = false

local function onKeyPress(event)
    if (event.phase == "down") then
        local key = event.keyName

        -- Перемещение персонажа
        if (key == "a") then
            player:setLinearVelocity(-200, 0)
        elseif (key == "d") then
            player:setLinearVelocity(200, 0)
        end

        -- Прыжок персонажа
        if (key == "w" and not isJumping) then
            player:applyLinearImpulse(0, -0.1, player.x, player.y)
            isJumping = true
        end

        -- Стрельба персонажа
        if (key == "space") then
            local projectile = display.newCircle(player.x, player.y, 5)
            projectile:setFillColor(0, 1, 0)
            physics.addBody(projectile, "dynamic", {radius = 5, isSensor = true})
    
            local mouseX = event.x
            local mouseY = event.y
    
            local deltaX = mouseX - player.x
            local deltaY = mouseY - player.y
    
            local angle = math.atan2(deltaY, deltaX)
            local force = 200
    
            projectile:applyForce(math.cos(angle) * force, math.sin(angle) * force, projectile.x, projectile.y)
        end
    elseif (event.phase == "up") then
        local key = event.keyName

        -- Остановка перемещения персонажа при отпускании клавиш
        if (key == "a" or key == "d") then
            player:setLinearVelocity(0, 0)
        end
    end
end

local function onCollision(event)
    if (event.phase == "began") then
        local obj1 = event.object1
        local obj2 = event.object2

        if ((obj1.name == "player" and obj2.name == "floor") or
            (obj1.name == "floor" and obj2.name == "player") or
            (obj1.name == "player" and obj2.name == "ceiling") or
            (obj1.name == "ceiling" and obj2.name == "player")) then
            isJumping = false
        end
    end
end

function scene:create(event)
    local sceneGroup = self.view

    physics.start()
    physics.setGravity(0, 9.8)

    -- Создание пола
    local floor = display.newRect(display.contentCenterX, display.contentHeight - 20, display.contentWidth, 40)
    floor:setFillColor(0.5)
    physics.addBody(floor, "static", {bounce = 0})
    floor.name = "floor"

    -- Создание потолка
    local ceiling = display.newRect(display.contentCenterX, 20, display.contentWidth, 40)
    ceiling:setFillColor(0.5)
    physics.addBody(ceiling, "static", {bounce = 0})
    ceiling.name = "ceiling"

    -- Создание персонажа
    player = display.newCircle(display.contentCenterX, display.contentHeight - 60, 20)
    player:setFillColor(1, 0, 0)
    physics.addBody(player, "dynamic", {radius = 20, bounce = 0})
    player.name = "player"

    -- Слушатели событий при нажатии клавиш и столкновения
    Runtime:addEventListener("key", onKeyPress)
    Runtime:addEventListener("collision", onCollision)

    -- Добавление объектов в сцену
    sceneGroup:insert(floor)
    sceneGroup:insert(ceiling)
    sceneGroup:insert(player)
end

-- Функция показа сцены
function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
    elseif (phase == "did") then
    end
end

-- Функция скрытия сцены
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
