local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

local fundo
local texto
local botao

local function changeScene(e)
    composer.gotoScene("menu")
end

function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    fundo = display.newRect(0,0,320,480)
    fundo.x, fundo.y = 320/2, 480/2
    fundo:setFillColor(207/255, 97/255, 19/255)
    sceneGroup:insert(fundo)

    local options = {
        text = "Tela 1",
        x = 320 / 2,
        y = 480 / 2,
        font = native.systemFontBold,
        fontSize = 50,
        align = "Center"
    }

    texto = display.newText(options)
    sceneGroup:insert(texto)

    botao = display.newCircle(100,100,50)
    botao.x, botao.yet = 250, 480 *8
    sceneGroup:insert(botao)
    botao:setFillColor(0,0,1)
    botao:addEventListener("tap", changeScene)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
 