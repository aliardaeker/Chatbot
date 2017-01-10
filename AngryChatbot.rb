require "observer"
require './Chatbot'

# Angry bot which has quniue greeting and goodbye messages with its associated dictionary
# Implements observer pattern
class AngryChatbot < Chatbot
	attr_reader :file
	
	def initialize
		@file = nil
	end
	
	# Read its dictionary
	def readDictionary
		@file = File.new("chatter_angry.txt").read
	end
	
	# Unique welcome message
	def greeting()
		puts("\nWhat do you want from me? Don't you see I am busy. Say it quick!")
	end
	
	# Update is called if a notification comes from the user
	def update(input)
		selectResponseStrategy(input, @file)
	end
	
	# Unique goodbye message
	def goodbye()
		puts("\nDon't you dare to talk to me again or I will kill you!")
	end
end