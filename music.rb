class Library
	require "csv"

	def initialize
		@library = Hash.new
	end

	def play
		get_artists
		get_songs
		begin
			queries
		end while @query != ""
	end

	def get_artists
		CSV.foreach("music.csv", headers: true) do |row|
			artist = row["Artist"]
			song = row["Name"]
			@library[artist] = []
		end
	end

	def get_songs
		CSV.foreach("music.csv", headers: true) do |row|
			artist = row["Artist"]
			song = row["Name"]
			@library.each_key do |key|
				if artist == key
				@library[key] << song
				end
			end
		end
	end

	def queries
		print "Query: "
		@query = gets.chomp
		if @query == ""
			puts "Goodbye, see you next time!"
		elsif @library[@query] == nil
			puts "Check your spelling, or try another artist!"
		else
			output
		end
	end

	def output
		puts
		message = "* Songs by #{@query} *"
		puts "*" * message.length
		puts message
		puts "*" * message.length
		puts @library[@query]
		puts
	end
end

song_library = Library.new
song_library.play