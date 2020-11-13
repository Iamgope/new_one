local push = require "push"
Class= require "class"
require 'Bird'
width=1200
height=720

virtual_width=512
virtual_height=288

local background=love.graphics.newImage('background.png')
local backgroundScroll=0

local ground= love.graphics.newImage('ground.png')
local groundScroll=0
local BG_scroll_speed=3
local G_scroll_speed=6
local Background_looping_point=413
local bird=Bird()

function love.load()
    love.graphics.setDefaultFilter('nearest','nearest')

    love.window.setTitle('Kootna_mat')
    push:setupScreen(virtual_width,virtual_height,width,height, {
      vsync=true,
      fullscreen=false,
      resizable=true
    })

end




function love.resize(w,h)
    push:resize(w,h)
end

function love.keypressed(key)
    if key=='escape' then
        love.event.quit()

    end
end

function love.update(dt)
    backgroundScroll=(backgroundScroll + BG_scroll_speed+dt)%Background_looping_point
    groundScroll=(groundScroll + G_scroll_speed+dt)%virtual_width
end

function love.draw()
    push:start()
    love.graphics.draw(background,-backgroundScroll,0)

    love.graphics.draw(ground,-groundScroll,virtual_height-16)
    bird:render()
    push:finish()
end

