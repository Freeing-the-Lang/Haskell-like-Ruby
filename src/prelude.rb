# Prelude for Haskell-like-Ruby
def let(var, value)
  Object.const_set(var, value.freeze)
end

def pipe(value, *funcs)
  funcs.reduce(value) { |v, f| f.call(v) }
end
