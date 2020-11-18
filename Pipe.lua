Pipe = Class{}

local pipe_img=love.graphics.newImage('pipe.png')

local pipe_scroll=-3

function Pipe:init()
    self.x=virtual_width
    self.y=math.random(virtual_height/4,virtual_height-10)
    self.width=pipe_img:getWidth()
end

function Pipe:update(dt)
    self.x=self.x+pipe_scroll+dt
end

function Pipe:render()
    love.graphics.draw(pipe_img,self.x,self.y)
end
 
