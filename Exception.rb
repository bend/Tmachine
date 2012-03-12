class SymbolException < Exception
	attr :message
	
	def initialize(msg)
		@message = msg
	end
end

class ParseException < Exception
	attr :message
	
	def initialize(msg)
		@message = msg
	end
end

