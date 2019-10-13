tests
testConversionToEagerCollection
	
	"10 is just a number; pick another number, any number..."
(	Array with: {} with: (1 to: 10))
		do: [ :range | 
			self
				assert: range asSrfi41Stream
				equals: range
				modulo: #asOrderedCollection.
			self assert: range asSrfi41Stream equals: range modulo: #asArray ]