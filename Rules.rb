
class Rules

	attr	:rules
	
	def initialize(r)
		@rules = {}
		parseRules(r)
	end

	def applyRule(state, symbol)
		begin 
			return rules[state][symbol]
		rescue
			return nil
		end
	end

private
	
	def parseRules(r)
		for i in 0..r.length do
			if i%5 ==0	# State
				state = r[i].to_s
				sym = r[i+1].to_s
				newState = r[i+2].to_s
				newSym = r[i+3].to_s
				move = r[i+4].to_s
				arr = []
				arr[POS_STATE] = newState
				arr[POS_SYM] = newSym
				arr[POS_MOVE]  = move
				if rules[state] == nil
					hash = {}
					hash[sym] = arr
					rules[state] = hash
				else
					rules[state][sym] = arr
				end
				i+=4
			end
		end
	end

end

