#!/usr/local/bin/ruby

class Node

	attr_accessor :next
	attr_accessor :prev
	attr_accessor :elem

public
	
	def initialize
		@next = nil
		@prev = nil
		@elem = 'B'
	end

	def setNext(node)
		@next = node
		node.prev=self
	end

	def setPrev(node)
		@prev = node
		node.next=self
	end

	def setElem(elem)
		@elem = elem
	end

end

