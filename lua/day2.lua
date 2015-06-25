dofile('util.lua')

function concatenate( a1, a2 )
  -- return a new table instead of mutating inputs
  a3 = {}
  for k,v in pairs( a1 ) do
    a3[#a3 + 1] = v
  end
  for k,v in pairs( a2 ) do
    a3[#a3 + 1] = v
  end
  setmetatable(a3, getmetatable(a1))
  return a3
end

local mt = {
  __index = strict_read,
  __newindex = strict_write
}

local _private = {}
function strict_read( table, key)
  if _private[key] then
    return _private[key]
  else
    error("Invalid key: " .. key)
  end
end

function strict_write( table, key, value)
  if value and _private[key] then
    error( "Duplicate key: " .. key )
  else
    _private[key] = value
  end
end

treasure = {}
setmetatable(treasure, mt )

local add_or_cat_arrays = function(a, b)
  if type(a) == 'table' and type(b) == 'table' then
    return concatenate(a, b)
  else
    return a+b
  end
end



-- from util.lua
table_metatable.__add = add_or_cat_arrays

function exercise_medium1()
  a0 = {1,2,3}
  a1 = {4,5,6}
  setmetatable(a0, table_metatable)
  setmetatable(a1, table_metatable)
  a1_2 = a0 + a1

  print( "a0: " .. tostring( a0 ) .. "\n" )
  print( "a1: " .. tostring( a1 ) .. "\n" )
  print( "a0 + a1: " .. tostring( a1_2 ) .. "\n" )
end



dofile( 'queue.lua' )

function exercise_medium2()
  local q = Queue:new()
  q:add(1)
  q:add(2)
  q:add(3)
  -- print 1 2 3 nil
  print(
    tostring( q:remove() ) .. ", " ..
    tostring( q:remove() ) .. ", " ..
    tostring( q:remove() ) .. ", " ..
    tostring( q:remove() )
  )
end

exercise_medium2()
