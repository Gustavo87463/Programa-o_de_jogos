local physics = require('physics')
physics.start()
physics.setGravity(0,0)

local w = display.contentWidth
local h = display.contentHeight

local campo = display.newImageRect("soccer.png", w, h)
campo.x, campo.y = w / 2, h / 2

local pessoa = display.newImageRect("people.png", 190/2, 106/2)
pessoa.x, pessoa.y = w / 2, h * 3/4
pessoa.name = "pessoa"
local ball = display.newImageRect("ball.png", 25, 25)
ball.x, ball.y = w / 2, h / 2
ball.name = "ball"

local gols = {}
gols[1] = display.newRect(w / 2, 10, 90, 1)
gols[1].name = "golCima"
gols[2] = display.newRect(w / 2, 475, 90, 1)
gols[2].name = "golBaixo"

physics.addBody(gols[1], "static")
physics.addBody(gols[2], "static")

physics.addBody(pessoa, "dynamic", {radius = 25})
physics.addBody(ball, "dynamic", {radius = 25})


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

local options = {
    text = "0 X 0",
    x = w / 2,
    y = -30,
    font = native.systemFontBold,
    fontSize = 58
}
local placar = display.newText(options)
placar:setFillColor(0, 1, 0)

local function movimentacao(e)
    if e.phase == "began" or e.phase == "moved" then
        --code
        if e.target.name == "right" then    
            --code
            passox = 5
            pessoa.rotation = 90
        elseif e.target.name == "left" then
            --code
            passox = -5
            pessoa.rotation = 270
        elseif e.target.name == "up" then
            --code
            passoy = -5
            pessoa.rotation = 0
        elseif e.target.name == "down" then
            --code
            passoy = 5
            pessoa.rotation = 180
        end
    elseif e.phase == "ended" or e.phase == "cancelled" then
        --code
        passox, passoy = 0, 0
    end    
end        
          

local function update (e)
    --code update
    pessoa.x = pessoa.x + passox
    pessoa.y = pessoa.y + passoy
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

Runtime:addEventListener("collision", marcarGols)




Runtime:addEventListener("enterFrame", update)