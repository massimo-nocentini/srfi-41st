tests
testAt
	(1 to: 10) in: [ :interval | 
		| aStream |
		aStream := interval asSrfi41Stream.
		interval do: [ :each | self assert: (aStream at: each) equals: each ].
		self should: [ aStream at: -1 ] raise: SubscriptOutOfBounds.
		self
			should: [ aStream at: interval size + 1 ]
			raise: SubscriptOutOfBounds ]