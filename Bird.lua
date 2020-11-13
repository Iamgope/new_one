Bird = Class{}

function Bird:init()
    self.image = love.graphics.newImage('bird.png')
    self.width =self.image:getWidth()
    self.height =self.image:getHeight()

    self.x = virtual_width/2- (self.width/2)
    self.y = virtual_height/2 -(self.height/2)

    --self.dy = 0
end

function Bird:render()
    love.graphics.draw(self.image, self.x , self.y)
end