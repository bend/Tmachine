#!/usr/local/bin/ruby
require 'Global.rb'
require 'Exception.rb'

class Loader
	attr_reader :alphabet
	attr_reader :tape
	attr_reader :rules
	def initialize(path)
		@rules = []
		File.open(path).each do |line|
			if line.length == 1
				return
			end
			r = line.rindex(';') - 1
			if line =~ /^TAPE=>/
				if tape == nil
					@tape = line[6..r]
				else
					raise ParseException.new("multiple tapes found")
				end
			elsif line.match(/^RULE=>/)
				parseRule(line[6..r])
			elsif line.match(/^ALPH=>/)
				if alphabet == nil
					@alphabet = line[6..line.length-2]
				else
					raise ParseException.new("multiple alphabet found")
				end
			else
				raise ParseException.new("Syntax error")
			end
			
		end
	end

	def parseRule(rule)
		r = rule.split(' ')
		if r.length != 5
			raise ParseException.new("Syntax error")
		else
			r.each do |e|
				rules.push(e)
			end
		end
	end
end

