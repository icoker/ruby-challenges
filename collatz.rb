def collatz (n)
    max = 0
    maxNum = 0

    n.times do |num|
        i = 1
        element = num
        if num > 1

            while num != 1
                num % 2 == 0 ? num = num / 2 : num = 3 * num + 1
                i += 1
            end

            if i > max
                max = i
                maxNum = element
            end
        end
    end

    puts "The number with longest Collatz sequence between 1 and " + n.to_s + " is " + maxNum.to_s + " with " + max.to_s + " steps."
end

puts "How many digits?"
collatz(gets.to_i)