function ends_in_3( num )
  if ( num % 10 == 3 ) then
    return true
  end
  return false
end

function is_prime( i )
  -- just trial division
  local upper_bound = math.sqrt( i )

  if i < 2 then return false end
  if i == 2 then return true end
  if i % 2 == 0 then return false end
  for divisor = 3, upper_bound, 2 do
    if i % divisor == 0
      then return false
    end
  end

  return true
end

function is_prime_that_ends_in_3( i )
  return ends_in_3( i ) and is_prime( i)
end

function primes_that_end_in_3( n )
  local remaining_primes_to_find = n
  local i = 3

  while remaining_primes_to_find >= 1 do
    if is_prime_that_ends_in_3( i ) then
      remaining_primes_to_find = remaining_primes_to_find - 1
      print( i )
    end
    i = i+1
  end
end


function fo( a, b, f )
  local i = a

  while i <= b do
    f( i )
    i = i + 1
  end
end

function reduce( iterations, initial, f )
  local intermediate = initial

  for i = initial, iterations do
    intermediate = f(intermediate, i)
  end

  return intermediate
end

function add(term0, term1)
  return term0 + term1
end

function multiply( product, factor )
  return product * factor
end

function factorial(n)
  return reduce(n,1,multiply)
end
