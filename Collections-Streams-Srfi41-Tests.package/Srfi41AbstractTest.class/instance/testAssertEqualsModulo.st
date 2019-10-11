tests
testAssertEqualsModulo
	10
		in: [ :n | 
			self
				shouldnt: [ self
						assert: (1 to: n)
						equals: (1 to: n) asOrderedCollection
						modulo: #asArray ]
				raise: TestFailure .
				self
				should: [ self
						assert: (1 to: n+1)
						equals: (1 to: n) asOrderedCollection
						modulo: #asArray ]
				raise: TestFailure ]