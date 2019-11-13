tests
testNthRootsOfUnity
	10
		in: [ :n | 
			self
				assert:
					((Srfi41NumbersSequence nthRootsOfUnity
						collect:
							[ :roots | (roots collect: #abs) allSatisfy: [ :each | each closeTo: 1 ] ])
						next: n) and ].
	3
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence nthRootsOfUnity next: n)
				equals:
					{(Array with: 1 + 0 i).
					(Array with: 1 + 0 i with: -1.0 + 1.2246467991473532e-16 i).
					(Array
						with: 1 + 0 i
						with: -0.4999999999999998 + 0.8660254037844388 i
						with: -0.5000000000000006 - 0.8660254037844385 i)}
				modulo: #asOrderedCollection ]