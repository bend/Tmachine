#!/usr/local/bin/ruby
require 'Global.rb'


class Printer
	attr :file

	def initialize(device)
		@file = File.new(device, "w")
	end

	def print(str,type)
		case type
		when INFO
			file.syswrite(str+"\n")
		when STATUS
			file.syswrite("---------------------\n")
			file.syswrite(str)
			file.syswrite("\n---------------------\n")
		when WARNING
			file.syswrite("FATAL: ")
			file.syswrite(str+"\n")
		when TAPE
			str.each do |e|
			file.syswrite(e+ " | ")
			end
			file.syswrite("\n")
		end
	end

	def close()
		file.close
	end
end

