class FizzBuzz
	
	def play
		range = (1..100)
		range.each do |i|
			puts
			print "Fizz" unless i % 3 != 0
			print "Buzz" unless i % 5 != 0
			if i % 3 != 0 and i % 5 != 0
				print i
			end
		end
	end

	def go
		range = (1..100)
		range.each do |i|
			if i % 15 == 0
				puts "FizzBuzz"
			elsif i % 3 == 0
				puts "Fizz"
			elsif i % 5 == 0
				puts "Buzz"
			else
				puts i
			end
		end
	end
end

FizzBuzz.new.play
puts
puts "-----"
puts
FizzBuzz.new.go