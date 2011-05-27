#!/usr/local/bin/ruby
require 'Tmachine.rb'

r = ['START','0','CONT','B','->',
	 'CONT' ,'1','CONT','1','->',
	 'CONT' ,'0','CONT','0','->',
	 'CONT' ,'B','STOP','0','<>',
	]
init = '00111000021010101010010101011001110100000'
alp = '012B'

tm = Tmachine.new(alp, init, r)
tm.start()

