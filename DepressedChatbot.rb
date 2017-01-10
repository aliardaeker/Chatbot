require "observer"
require './Chatbot'

# Sad bot which has quniue greeting and goodbye messages with its associated dictionary
# Implements observer pattern
class DepressedChatbot < Chatbot	
	attr_reader :file
	
	def initialize
		@file = nil
	end
	
	# Read its dictionary
	def readDictionary
		@file = File.new("chatter_sad.txt").read
	end
	
	# Unique welcome message
	def greeting()
		puts("\nHello, I feel kinda blue but can talk to you for a while I guess.")
	end
	
	# Update is called if a notification comes from the user
	def update(input)
		selectResponseStrategy(input, @file)
	end
	
	# Unique goodbye message
	def goodbye()
		puts("\nOk I will go to the restroom to cry now. Good luck in you life.")
	end
end