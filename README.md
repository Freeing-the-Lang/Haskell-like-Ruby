# Haskell-like-Ruby

Experimental interpreter that mimics Haskell-like functional patterns in pure Ruby.

### ✨ Features
- Lambda expressions (`->(x){x+1}`)
- Higher-order functions (`map`, `fold`)
- Lazy evaluation & pipe chains (`pipe`, `lazy`)
- Immutable data with `let`

### 🚀 Example
```ruby
nums = [1, 2, 3, 4]
double = ->(x){x*2}
sum_fn = ->(a,b){a+b}
print(fold(map(nums, double), 0, sum_fn))
