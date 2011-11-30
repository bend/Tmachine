#!/usr/local/bin/ruby
$LOAD_PATH << '.'
require 'Tmachine.rb'
if ARGV.length>0
	tm = Tmachine.new(ARGV[0])
	# start the tmachine
	tm.start()
else
	puts 'USAGE: main filename'
end


