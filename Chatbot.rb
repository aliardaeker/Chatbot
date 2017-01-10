require "observer"
require './QuestionStrategy'
require './MatchStrategy'
require './ChangeSubjectStrategy'
require './EndConversationStrategy'

# Abstract class for bots
class Chatbot
	attr_reader :user
	
	def initialize
		raise NoMethodError
	end
	
	# Template method here, all 3 bots should follow this order of calling functions
	def enterChat(user)
		@user = user
		saveUser(user)
		register(user)
		readDictionary()
		greeting()
	end
	
	def readDictionary
		raise NoMethodError
	end
	
	def greeting()
		raise NoMethodError
	end
	
	# Selecting strategy based on if a partial match is found or a question mark is entered
	def selectResponseStrategy(input, file)
		match = MatchStrategy.new()
		question = QuestionStrategy.new()
		change = ChangeSubjectStrategy.new()
		endConversation = EndConversationStrategy.new()
	
		if (match.findResponse(input, file))
		elsif (question.findResponse(input))
		elsif (endConversation.findResponse(input))
			goodbye()
			deregister(@user)
		elsif (change.findResponse(file))
		else puts("\nError in selectResponseStrategy.") end
	end
	
	def update(input)
		raise NoMethodError
	end
	
	# Saves user as a instance
	def saveUser(user)
		@user = user
	end
	
	# Deregisters at the end of the program
	def deregister(user)
		user.delete_observer(self)
	end
	
	# Bot registered at the beginning of the program
	def register(user)
		user.add_observer(self)
	end
end