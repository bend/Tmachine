$LOAD_PATH << './'
require 'Node.rb'
require 'Exception.rb'

class Tape 

	attr_accessor 	:current
	attr_accessor 	:head
	attr_reader		:alphabet
	attr_reader		:position

	def initialize(alph)
		@head= Node.new
		head.setElem(EMPTY)
		@current = head
		@alphabet = alph
		@position = 0
	end

	def fillTape(init)
		init.each_char do |e|
			if alphabet.include? e.to_s
				node = Node.new
				node.setElem(e)
				current.setNext(node)
				@current = node
			else
				raise SymbolException.new("Symbol \'" + e + "\' not in alphabet")
			end
		end
		@current = head.next
	end

	def putSymbol(s)
		if alphabet.include? s.to_s
			current.setElem(s)
		else 
			raise SymbolException.new( "Symbol \'" + e + "\' not in alphabet")
		end
	end

	def leftMove
		if current.prev != nil
			@current = current.prev
			@position-=1
		else
			node = Node.new
			node.setNext(current)
			@current = node
			@head = current
			@position = 0
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
		@position+=1
	end

	def getUnderCur
		return current.elem
	end

	def toString
		cur = head.next
		str_buf=[]
		str_buf.push(position)
		while cur != nil && cur.elem != nil
			str_buf.push(cur.elem)
			cur = cur.next
		end
		return str_buf
	end

end

