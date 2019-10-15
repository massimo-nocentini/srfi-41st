tests
testHamming
	30
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence hamming next: n)
				equals:
					#(1 2 3 4 5 6 8 9 10 12 15 16 18 20 24 25 27 30 32 36 40 45 48 50 54 60 64 72 75 80)
				modulo: #asOrderedCollection ]