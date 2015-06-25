Queue = {
  __index = Queue,

  new = function()
    local self = setmetatable( {}, Queue )
    self.queue = {}

    return self
  end,

  add = function( self, item )
    table.insert( self.queue, 1, item )
    return self
  end,

  remove = function(self)
    local val = self.queue[#self.queue]
    self.queue[#self.queue] = nil
    return val
  end

}
