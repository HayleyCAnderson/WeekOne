class Lockers

	def initialize
		@lockers = (1..100)
		@students = (1..100)
		@locker_array = ["Lockers:"]
	end

	def go
		locker_loop
		results
	end

	private

	def locker_loop

		@lockers.each do |locker_num|

			@locker_array << false

			@students.each do |student_num|

				if locker_num % student_num == 0

					if @locker_array[locker_num] == true
						@locker_array[locker_num] = false
					else
						@locker_array[locker_num] = true
					end
				end
			end

			if @locker_array[locker_num] == true
				@locker_array[locker_num] = "#{locker_num}: open"
			else
				@locker_array[locker_num] = "#{locker_num}: closed"
			end
		end
	end

	def results
		puts @locker_array
	end
end

locker_set = Lockers.new
locker_set.go