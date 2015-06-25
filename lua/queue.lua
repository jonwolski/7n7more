Queue = {

  new = function()
    local queue = {}

    local add = function( item )
      table.insert( queue, 1, item )
    end

    local remove = function()
      local val = queue[#queue]
      queue[#queue] = nil
      return val
    end

    local obj = {
      add=add,
      remove=remove
    }
    return obj

  end

}
