tests
testSort
	self
		assert:
			(((100 srfi41Collatz ) next: 40) sort: [ :a :b | a < b ])
				asOrderedCollection
		equals:
			#(1 1 1 1 1 2 2 2 2 2 2 4 4 4 4 4 4 5 8 10 11 13 16 17 19 20 22 25 26 29 34 38 40 44 50 52 58 76 88 100)
				asOrderedCollection