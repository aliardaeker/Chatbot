require_relative 'User'
require_relative 'DepressedChatbot'
require_relative 'HappyChatbot'
require_relative 'AngryChatbot'

# Starting point of the program
def main()
	# Given driver code, no change by me
	puts("\nPlease enter your name: ")
	name = gets().chomp()
	user = User.new(name)
	
	bots = []
	bots << HappyChatbot.new()
	bots << AngryChatbot.new()
	bots << DepressedChatbot.new()

	bots.each { |b|
		b.enterChat(user)
	}
	
	while user.count_observers > 0
		user.converse
	end
end

main()