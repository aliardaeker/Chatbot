# Abstract class for the strategies
class Response	
	attr_accessor :responseHash
	
	def initialize()
		@responseHash = Hash.new
	end
	
	def findResponse(input, file)
		raise NoMethodError
	end
	
	# Takes the dictionary as a parameter and parses it as a partial matches and possible responses
	# Creates a hash table and pairs matches with responses as key value pairs
	# Keys are partial matches and values are string arrays that hold the possible responses
	def parseDictionary(file)
		index = 0
		key = ""
		flagFound = false
		responses = []
		responseNo = 0
	
		# Reads the dictionary character by character
		for i in 0..(file.size)
			# If a ':' is found then partial match is started to be read
			if (file[i] == ":")
				j = i
			
				# Partial match got here
				while (true)
					if (file[j] == ";" || file[j] == ".")
						flagFound = true	
						break
					end
					
					if (j == 0) 
						break 
					end
					
					j = j - 1
				end
				
				# If a partial match is found in the first sectence
				# This is different because this match doesn't hace a ';' before it like others
				if (!flagFound)
					for k in 0..(i-4)
						key[k] = file[k+3]
					end
				# If a partial match is found at the rest of the file 
				else 
					for k in (j+2)..(i-1)
						key[index] = file[k]
						index = index + 1
					end
				end
				
				eachResponse = ""
				index2 = i + 1
				counter2 = 0
				
				# After the partial match is found, file is scanned to find possible responses
				for m in (i+1)..(file.size)
					if (file[m] == ":")
						break
					end
					
					# For each response list, an array is generated and filled with each possible response associated with its partial match
					if (file[m] == ";") 
						for t in (index2+1)..(m-1)
							eachResponse[counter2] = file[t]
							counter2 = counter2 + 1
						end
						
						responses[responseNo] = eachResponse.strip
						responseNo = responseNo + 1
						index2 = m + 1
						counter2 = 0
						eachResponse = ""
					end	
				end

				# Partial match and possible responses are stored in a hash table as key-value pairs
				@responseHash[key.strip] = responses
				responses = []
				responseNo = 0
				index = 0
				key = ""
				flagFound = false
			end	
		end
	end
end