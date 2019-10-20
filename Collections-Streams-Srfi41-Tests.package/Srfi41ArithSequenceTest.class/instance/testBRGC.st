tests
testBRGC
	30
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence binaryReflectedGrayCodes next: n) flatten
				equals: #()
				modulo: #asOrderedCollection ]