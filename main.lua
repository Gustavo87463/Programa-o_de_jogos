local botoes  = {}
    botoes[1] = display.newRect(0, 0,150,150)
    botoes[2] = display.newRect(0, 0,150,150)
    botoes[3] = display.newRect(0, 0,150,150)
    botoes[4] = display.newRect(0, 0,150,150)


botoes[1]:setFillColor(29/255, 26/255, 235/255)
botoes[2]:setFillColor(235/255, 26/255, 50/255)
botoes[3]:setFillColor(214/255, 232/255, 21/255)
botoes[4]:setFillColor(21/255, 232/255, 39/255)



local w = display.contentWidth
local h = display.contentHeight

botoes[1].x = w / 4
botoes[1].y = h / (5/2)
botoes[2].x = w / 4 * 3
botoes[2].y = h / (5/2)
botoes[3].x = w / 4
botoes[3].y = h / 4 * 3
botoes[4].x = w / 4 * 3
botoes[4].y = h / 4 * 3

botoes[1].name = "sound1"
botoes[2].name = "sound2"
botoes[3].name = "sound3"
botoes[4].name = "sound4"

local soundTable = {
    sound1 = audio.loadSound("zap1.ogg"),
    sound2 = audio.loadSound("zap2.ogg"),
    sound3 = audio.loadSound("zapThreeToneDown.ogg"),
    sound4 = audio.loadSound("zapThreeToneUp.ogg")
}

local options = {
    text = "Placar: ",
    x = w / 2,
    y = -30,
    font = native.systemFontBold,
    fontSize = 35
}

local placar = display.newText(options)
placar:setFillColor(1, 1, 1)

local function playSound(e)
    audio.play(soundTable[e.target.name])
end

for i = 1, #botoes do
    botoes[i]:addEventListener("tap", playSound)
end