tests
testRepeat
	30 in: [ :n | 
		self
			assert: (1 srfi41Repeat next: n)
			equals: ((1 to: n) collect: [ :_ | 1 ])
			modulo: #asOrderedCollection ]