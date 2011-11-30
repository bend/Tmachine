#!/usr/local/bin/ruby
$LOAD_PATH << './'
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
			pos = str[0]
			str.shift
			str.each do |e|
				file.syswrite(e.to_s+ "|")
			end
			file.syswrite("\n")
			for i in 1..pos*2 do
				file.syswrite(" ")
			end
			file.syswrite("^\n")
		end
	end

	def close()
		file.close
	end
end

