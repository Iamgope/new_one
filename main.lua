local push = require "push"
Class= require "class"
require 'Bird'
require 'Pipe'
width=1200
height=720

virtual_width=512
virtual_height=288

local background=love.graphics.newImage('background.png')
local backgroundScroll=0

local ground= love.graphics.newImage('ground.png')
local groundScroll=0
local BG_scroll_speed=1
local G_scroll_speed=3
local Background_looping_point=413
local bird=Bird()
local pipes={}
local timer=0
function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')

    love.window.setTitle('Kootna_mat')
    push:setupScreen(virtual_width,virtual_height,width,height, {
      vsync=true,
      fullscreen=false,
      resizable=true
    })
    love.keyboard.keysPressed={}

end




function love.resize(w,h)
    push:resize(w,h)
end







function love.keypressed(key)

    love.keyboard.keysPressed[key]=true

    if key=='escape' then
        love.event.quit()

    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end
  


function love.update(dt)
    backgroundScroll=(backgroundScroll + BG_scroll_speed+dt)%Background_looping_point
    groundScroll=(groundScroll + G_scroll_speed+dt)%virtual_width

    
    timer=timer+dt
    if timer>0.7 then
        table.insert(pipes,Pipe())
        timer=0
    end
    bird:update(dt)

    for k,pipe in pairs(pipes) do
        pipe:update(dt)
        if pipe.x < -pipe.width then
            table.remove(pipes,k)
        end
    end
   -- pipe:update(dt)

    love.keyboard.keysPressed={}
end

function love.draw()
    push:start()
    love.graphics.draw(background,-backgroundScroll,0)


    for k,pipe in pairs(pipes) do
        pipe:render()
    end
    love.graphics.draw(ground,-groundScroll,virtual_height-16)
    bird:render()
    push:finish()
end

