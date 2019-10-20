tests
testCrossProduct
	self
		assert: {} asSrfi41Stream crossProduct
		equals: {}
		modulo: #asOrderedCollection.
	self
		assert:
			({(1 srfi41CountForward next: 10)} asSrfi41Stream crossProduct
				collect: #asOrderedCollection)
		equals: ((1 to: 10) collect: [ :each | {each} asOrderedCollection ])
		modulo: #asOrderedCollection.
	self
		assert:
			(((OrderedCollection new
				add: 1 srfi41CountForward;
				add: $a srfi41Repeat;
				add: 0 srfi41CountBackward;
				asSrfi41Stream) crossProduct next: 20)
				collect: #asOrderedCollection)
		equals: {}
		modulo: #asOrderedCollection