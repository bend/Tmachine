#!/usr/local/bin/ruby
require 'Node.rb'

class Tape 

	attr_accessor :current
	attr_accessor :head

	def initialize
		@head= Node.new
		head.setElem('')
		@current = head
	end

	def fillTape(init)
		init.each_char do |e|
			node = Node.new
			node.setElem(e)
			current.setNext(node)
			@current = node
		end
		@current = head.next
	end

	def putSymbol(s)
		current.setElem(s)
	end

	def leftMove
		if current.prev != nil
			@current = current.prev
		else
			node = Node.new
			node.setNext(current)
			@current = node
		end
	end
	
	def rightMove
		if current.next != nil
			@current = current.next
		else
			node = Node.new
			node.setPrev(current)
			@current = node
		end
	end

	def getUnderCur
		return current.elem
	end

	def toString
		cur = head
		str_buf=""
		while cur != nil && cur.elem != nil
			str_buf+=cur.elem
			cur = cur.next
		end
		return str_buf
	end

end

