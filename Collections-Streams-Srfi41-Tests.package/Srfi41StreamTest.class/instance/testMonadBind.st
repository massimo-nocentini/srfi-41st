tests
testMonadBind
	30
		in: [ :n | 
			self
				assert:([ :i | i srfi41CountBackward ] >>= 1 srfi41CountForward next: n)
				
				equals:
					#(1 2 0 3 1 -1 4 2 0 -2 5 3 1 -1 -3 6 4 2 0 -2 -4 7 5 3 1 -1 -3 -5 8 6)
				modulo: #asOrderedCollection ]