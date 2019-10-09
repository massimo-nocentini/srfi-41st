tests
testRepeat
	30 in: [:n | self
		assert: (1 srfi41Repeat next: n) asOrderedCollection
		equals:
			((1 to: n) collect: [ :i | 1 ])
				asOrderedCollection]