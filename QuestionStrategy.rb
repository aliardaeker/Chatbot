require './Response'

# Question strategy class for questions asked by the user
class QuestionStrategy < Response
	@@deflectionCounter = 0
	
	def initialize()
		# 3 deflections
		@deflectionPhrases = ["Actually what about you, how do you feel?", "Well, I was wondering what your opinin is about this subject.", "In fact I was going to ask the same question to you."]
	end
	
	def findResponse(input)
		# If a question mark is found in user input 3 deflections are cycled
		if (input[input.size - 1] == "?")
			puts("\n" + @deflectionPhrases[@@deflectionCounter] + "\n")
			@@deflectionCounter = @@deflectionCounter + 1
			return true
		else
			return false
		end
	end
end