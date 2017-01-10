require "observer"

# Subject in observer pattern
class User
	include Observable
	attr_reader :name
	
	def initialize(name)
		@name = name
	end
	
	# Notifies bots if user enters a command
	def converse()
		puts("\nResponse: ")
		input = gets().chomp()
		changed
		notify_observers(input)
	end
end