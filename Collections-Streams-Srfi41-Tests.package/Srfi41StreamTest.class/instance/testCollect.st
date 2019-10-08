tests
testCollect
	self
		assert:
			((1 to: 10) asSrfi41Stream collect: [ :each | each ** 2 ])
				asOrderedCollection
		equals: #(1 4 9 16 25 36 49 64 81 100) asOrderedCollection 