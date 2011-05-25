#!/usr/local/bin/ruby
require 'Node.rb'
require 'Exception.rb'

class Tape 

	attr_accessor :current
	attr_accessor :head
	attr_reader	  :alphabet

	def initialize(alph)
		@head= Node.new
		head.setElem(EMPTY)
		@current = head
		@alphabet = alph
	end

	def fillTape(init)
		init.each_char do |e|
			if alphabet.include? e
				node = Node.new
				node.setElem(e)
				current.setNext(node)
				@current = node
			else
				raise SymbolException.new( 'Symbol not in alphabet')
			end
		end
		@current = head.next
	end

	def putSymbol(s)
		if alphabet.include? s
			current.setElem(s)
		else 
			raise SymbolException.new( 'Symbol not in alphabet')
		end
	end

	def leftMove
		if current.prev != nil
			@current = current.prev
		else
			node = Node.new
			node.setNext(current)
			@current = node
			@head = current
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
		cur = head.next
		str_buf=[]
		while cur != nil && cur.elem != nil
			str_buf.push(cur.elem)
			cur = cur.next
		end
		return str_buf
	end

end

