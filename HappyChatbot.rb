require "observer"
require './Chatbot'

# Happy bot which has quniue greeting and goodbye messages with its associated dictionary
# Implements observer pattern
class HappyChatbot < Chatbot
	attr_reader :file
	
	def initialize
		@file = nil
	end
	
	# Read its dictionary
	def readDictionary
		@file = File.new("chatter_happy.txt").read
	end
	
	# Unique welcome message
	def greeting()
		puts("\nHi there! What a lovely day right? I would love to talk to you for hours!")
	end
	
	# Update is called if a notification comes from the user
	def update(input)
		selectResponseStrategy(input, @file)
	end
	
	# Unique goodbye message
	def goodbye()
		puts("\nIt was very fun to talk to you! Thank you very much!")
	end
end