#!/usr/local/bin/ruby

def assert(*msg)
	raise "Assertion failed ! #{msg}" unless yield if $DEBUG
end
