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
    composer.gotoScene("scene2")
end

local function changeScene2(e)
    composer.gotoScene("scene3")
end

local function changeScene3(e)
    composer.gotoScene("scene4")
end



function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    fundo = display.newRect(0,0,320,480)
    fundo.x, fundo.y = 320/2, 480/2
    fundo:setFillColor(0,0,1)
    sceneGroup:insert(fundo)

    

    botao = display.newRect(100,100,150,80)
    botao.x, botao.yet = 320/2, 480 *.8
    sceneGroup:insert(botao)
    botao:setFillColor(0,0,0)
    botao:addEventListener("tap", changeScene)

    botao2 = display.newRect(200,200,150,80)
    botao2.x, botao2.yet = 320/2, 480 *.8
    sceneGroup:insert(botao2)
    botao2:setFillColor(0,0,0)
    botao2:addEventListener("tap", changeScene2)

    botao3 = display.newRect(300,300,150,80)
    botao3.x, botao3.yet = 320/2, 480 *.8
    sceneGroup:insert(botao3)
    botao3:setFillColor(0,0,0)
    botao3:addEventListener("tap", changeScene3)

    local options = {
        text = "Opção 1",
        x = 320 / 2,
        y = 100,
        font = native.systemFontBold,
        fontSize = 35,
        align = "Center"

    }


    texto = display.newText(options)
    sceneGroup:insert(texto)

    local options2 = {
        text = "Opção 2",
        x = 320 / 2,
        y = 200,
        font = native.systemFontBold,
        fontSize = 35,
        align = "Center"

    }


    texto2 = display.newText(options2)
    sceneGroup:insert(texto2)

    local options3 = {
        text = "Opção 3",
        x = 320 / 2,
        y = 300,
        font = native.systemFontBold,
        fontSize = 35,
        align = "Center"

    }


    texto3 = display.newText(options3)
    sceneGroup:insert(texto3)


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