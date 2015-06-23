table_to_string = function( t )
  local self = t
  local output = '{ '
  for k,v in pairs( t ) do
    output = output .. k .. ": "
    if v == self then
      output = output .. k
    elseif type( v ) == 'table' then
      output = output ..table_to_string( v )
    elseif type( v ) == 'function' then
      output = output .. "[function]"
    else
      output = output .. v
    end
    output = output .. ", "
  end

  output = output .. ' }'

  return output
end

table_metatable = {
  __tostring = table_to_string
}
