require './Response'

# Strategy for ending the conversation
class EndConversationStrategy < Response	
	# If the user enters a single word input without a question mark or a partial match is not found
	def findResponse(input)
		inputArray = input.split
		
		if (inputArray.size == 1) 
			return true
		else
			return false
		end
	end
end