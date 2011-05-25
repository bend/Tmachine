#!/usr/local/bin/ruby

class SymbolException < RuntimeError
	attr :message
	
	def initialize(msg)
		@message = msg
	end
end
