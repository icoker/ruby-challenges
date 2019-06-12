
def recursive_fib(n)
    return n if n <= 1
    recursive_fib(n-1) + recursive_fib(n-2)
end

def iterative_fib(n)
    fib = Array.new(n, 0)
    return 0 if n == 0
    fib.each_with_index do |n, i|
        if i >= 1
            fib[i] = fib[i-1] + fib[i-2]
        else
            fib[i] = 1
        end
    end
    return fib.pop
end


puts "Which digit of the Fibonacci series?"
num = gets.to_i
puts "-----"
puts "Recursive: " + recursive_fib(num).to_s
puts "Iterative: " + iterative_fib(num).to_s
puts


require 'benchmark'
num = 35
Benchmark.bm do |x|
    x.report("recursive_fib") { recursive_fib(num) }
    x.report("iterative_fib")  { iterative_fib(num)  }
end