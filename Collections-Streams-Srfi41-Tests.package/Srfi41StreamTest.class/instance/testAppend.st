tests
testAppend
	self
		assert:
			((1 to: 10) asSrfi41Stream , (11 to: 20) asSrfi41Stream)
				asOrderedCollection
		equals: (1 to: 20) asOrderedCollection