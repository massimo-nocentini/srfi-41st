tests
testConversionToEagerCollection
	self
		assert: {} asSrfi41Stream asOrderedCollection
		equals: OrderedCollection empty.

	"10 is just a number; pick another number, any number..."
	(1 to: 10)
		in: [ :range | 
			self
				assert: range asSrfi41Stream asOrderedCollection
				equals: range asOrderedCollection ]