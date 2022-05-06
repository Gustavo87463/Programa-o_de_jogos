local physics = require('physics')
physics.start()
physics.setGravity(0,0)

local w = display.contentWidth
local h = display.contentHeight

local campo = display.newImageRect("soccer.png", w, h)
campo.x, campo.y = w / 2, h / 2

--Sprites
--Sprite sheet
local sheetData = {
    width = 133, --135px, 4 frames, 135/5 = 45
    height = 199, --255px, 4 frames, 255/4 = 63
    numFrames = 16
}
local sheet = graphics.newImageSheet("sprite24.png", sheetData)

--aNIMATIONS SEQUENCES
local sequences = {
    {name = "paradoBaixo", start = 1, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "paradoEsquerda", start = 9, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "paradoDireita", start = 13, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "paradoCima", start = 5, count = 1, time = 300, loopCount = 1, loopDirection = 'forward'},
    {name = "andandoBaixo", start = 2, count = 3, time = 300, loopCount = 0, loopDirection = 'forward'},
    {name = "andandoEsquerda", start = 10, count = 3, time = 300, loopCount = 0, loopDirection = 'forward'},
    {name = "andandoDireita", start = 14, count = 3, time = 300, loopCount = 0, loopDirection = 'forward'},
    {name = "andandoCima", start = 6, count = 3, time = 300, loopCount = 0, loopDirection = 'forward'}
}

--Sprite object, junta Sprite com animation sequence
local pessoa = display.newSprite(sheet,sequences)
pessoa.x = w / 2
pessoa.y = h / 2
pessoa:scale(0.5, 0.5)

local botoes = {} -- cria uma lista
botoes[1] = display.newImageRect("arrow.png", 35, 35) --right
botoes[1].x, botoes[1].y = 285, 430
botoes[1].name = 'right'

botoes[2] = display.newImageRect("arrow.png", 35, 35) --left
botoes[2].x, botoes[2].y = 235, 430
botoes[2].rotation = 180
botoes[2].name = 'left'

botoes[3] = display.newImageRect("arrow.png", 35, 35) --up
botoes[3].x, botoes[3].y = 260, 395
botoes[3].rotation = 270
botoes[3].name = 'up'

botoes[4] = display.newImageRect("arrow.png", 35, 35) --down
botoes[4].x, botoes[4].y = 260, 460
botoes[4].rotation = 90
botoes[4].name = 'down'

local paredetopo = display.newRect(0, 1, 320, 0 )
physics.addBody(paredetopo, "static")
paredetopo.x = display.contentCenterX
paredetopo.name = "paredetopo"

local paredeesquerda = display.newRect(0, 0, 1, 480)
physics.addBody(paredeesquerda, "static")
paredeesquerda.y = display.contentCenterY
paredeesquerda.name = "paredeesquerda"

local parededireita = display.newRect(320, 0, 0, 480)
parededireita.y = display.contentCenterY
physics.addBody(parededireita, "static")
parededireita.name = "parededireita"

local paredebaixo = display.newRect(1, 480, 320, 0)
paredebaixo.x = display.contentCenterX
physics.addBody(paredebaixo, "static")
paredebaixo.name = "paredebaixo"

local passox, passoy = 0, 0
local golscima, golBaixo = 0, 0


local function movimentacao(e)
    if e.phase == "began" or e.phase == "moved" then
        --code
        if e.target.name == "right" then    
            --code
            passox = 5
            pessoa:setSequence("andandoDireita")
        elseif e.target.name == "left" then
            --code
            passox = -5
            pessoa:setSequence("andandoEsquerda")
        elseif e.target.name == "up" then
            --code
            passoy = -5
            pessoa:setSequence("andandoCima")
        elseif e.target.name == "down" then
            --code
            passoy = 5
            pessoa:setSequence("andandoBaixo")
        end
    elseif e.phase == "ended" or e.phase == "cancelled" then
        --code
        passox, passoy = 0, 0
        if e.target.name == "right" then
            pessoa:setSequence("paradoDireita")
        elseif e.target.name == "up" then
            pessoa:setSequence("paradoCima")
        elseif e.target.name == "left" then
            pessoa:setSequence("paradoEsquerda")    
        else
            pessoa:setSequence("paradoBaixo")
        end     
    end    
end        
          

local function update (e)
    --code update
    pessoa.x = pessoa.x + passox
    pessoa.y = pessoa.y + passoy
    pessoa:play()
end

for i=1, #botoes do
    botoes[i]:addEventListener("touch", movimentacao)
end

local function marcarGols (e)
    if e.object1.name == "golCima" and e.object2.name == "ball" then
        print("gol do time de baixo")
            golBaixo = golBaixo + 1
            placar.text = golBaixo .. " X " .. golCima
    elseif e.object1.name == "golBaixo" and e.object2.name == "ball" then
        print("gol do time de cima")
        golCima = golCima + 1
        placar.text = golsBaixo .. "X" .. golCima           
    end    
    --print(e.object1 .. "colide com" .. e.object2)
end

pessoa:setSequence("paradoBaixo")

Runtime:addEventListener("enterFrame", update)






