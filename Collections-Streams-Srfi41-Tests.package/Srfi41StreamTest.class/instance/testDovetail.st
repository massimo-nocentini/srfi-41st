tests
testDovetail
	| ones twos threes streams |
	ones :=  1  srfi41Repeat.
	twos :=  2  srfi41Repeat.
	threes :=  3  srfi41Repeat.
	streams := {ones.
	twos.
	threes} asSrfi41Stream.
	self
		assert: (streams dovetailClockwise concat next: 30)
		equals: #(1 1 2 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3)
		modulo: #asOrderedCollection.
	self
		assert: (streams dovetailCounterClockwise concat next: 30)
		equals: #(1 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1)
		modulo: #asOrderedCollection