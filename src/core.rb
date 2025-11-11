module HSR
  class Environment
    def initialize(parent = nil)
      @vars = {}
      @parent = parent
    end

    def get(name)
      @vars[name] || @parent&.get(name)
    end

    def set(name, value)
      @vars[name] = value
    end
  end

  class Interpreter
    def initialize
      @env = Environment.new
      @env.set("map", ->(arr, f) { arr.map(&f) })
      @env.set("fold", ->(arr, init, f) { arr.reduce(init, &f) })
      @env.set("print", ->(x) { puts x; x })
    end

    def eval(code)
      instance_eval(code)
    rescue Exception => e
      puts "⚠️ Error: #{e.message}"
    end
  end
end

if __FILE__ == $0
  i = HSR::Interpreter.new
  i.eval("print(map([1,2,3], ->(x){ x * 2 }))")
end
