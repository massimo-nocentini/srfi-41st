tests
testConversionToEagerCollection
	self
		assert: {} asSrfi41Stream
		equals: {}
		modulo: #asOrderedCollection.

	"10 is just a number; pick another number, any number..."
	(1 to: 10)
		in: [ :range | 
			self
				assert: range asSrfi41Stream 
				equals: range 
				modulo: #asOrderedCollection ]