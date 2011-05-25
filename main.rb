#!/usr/local/bin/ruby
require 'Tmachine.rb'

r = ['START','0','CONT','B','->',
	 'CONT' ,'1','CONT','1','->',
	 'CONT' ,'0','CONT','0','->',
	 'CONT' ,'B','STOP','0','<>',
	]
init = '0011100001010101010010101011001110100000'
puts init
alp = '012B'

tm = Tmachine.new(alp, init, r)
tm.start()

