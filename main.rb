#!/usr/local/bin/ruby
require 'Tmachine.rb'

r = ['START','0','CONT','B','->',
	 'CONT' ,'1','CONT','1','->',
	 'CONT' ,'0','CONT','0','->',
	 'CONT' ,'B','STOP','0','<>',
	]
init = '001101101'
puts init
alp = '0B'

tm = Tmachine.new(alp, init, r)
tm.start()
print tm.tape.toString()
puts ''

