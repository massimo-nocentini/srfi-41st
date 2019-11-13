tests
testNthRootsOfUnity
	10
		in: [ :n | 
			self
				assert:
					((Srfi41NumbersSequence nthRootsOfUnity
						collect:
							[ :roots | (roots collect: #abs) allSatisfy: [ :each | each closeTo: 1 ] ])
						next: 10) and ]