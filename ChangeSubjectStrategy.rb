require './Response'

# Change subject strategy if a match is not found and no question is given
class ChangeSubjectStrategy < Response
	# Always a different response is choses
	@@counter = 0
	
	def initialize()
		super
	end
	
	# Prints one of the message under change subject key to talk about something else
	def findResponse(file)
		parseDictionary(file)
		possibleResponses = @responseHash["change subject"]
		puts ("\n" + possibleResponses[@@counter] + "\n")
		@@counter = @@counter + 1
		if (@@counter == 4) 
			@@counter = 0
		end
		return true
	end
end