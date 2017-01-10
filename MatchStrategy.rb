require './Response'

# Match strategy class looks for a partial match in dictionary for the given user input
class MatchStrategy < Response
	@@responses = Hash.new
	
	def initialize()
		super
	end
	
	def findResponse(input, file)
		parseDictionary(file)
		inputArray = input.scan(/\w+/)
		counter = 0
		maxCounter = 0
		
		# 3 nested for loop scans the partial matches and calculates the longest match with the given input
		for i in 0..(@responseHash.length - 1)
			keysSplit = @responseHash.keys[i].split
			
			for j in 0..(inputArray.size - 1)	
				for k in 0..(keysSplit.size - 1)
					if (keysSplit[k] == inputArray[j]) 
						counter = counter + 1				
					end
				end
			end	
			
			if (counter > maxCounter)
				keyIndex = i
				maxCounter = counter
			end
			counter = 0
		end
		
		# If a match is not found
		if (maxCounter == 0)
			return false
		# If a match is found it is printed
		else
			possibleResponses = @responseHash.values[keyIndex]
			putsFlag = false
			
			# For storing the previously printed responses
			# Always a new response is printed until each one is printed
			for i in 0..(possibleResponses.size - 1)
				if(!@@responses.has_key?(possibleResponses[i]))
					puts("\n" + possibleResponses[i] + "\n")
					putsFlag = true
					@@responses[possibleResponses[i]] = true
					break
				end
			end
			
			# If all the responses are printed it is started from the beginning
			if(!putsFlag)
				puts("\n" + possibleResponses[0] + "\n")
				@@responses.clear
				@@responses[possibleResponses[0]] = true
			end
			
			return true
		end
	end
end











