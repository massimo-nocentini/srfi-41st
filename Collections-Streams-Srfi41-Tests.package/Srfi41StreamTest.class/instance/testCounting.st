tests
testCounting
	0 -> 30
		in: [ :assoc | 
			| start nel |
			start := assoc key.
			nel := assoc value.
			self
				assert: (start srfi41CountForward next: nel)
				equals: (start to: nel - 1)
				modulo: #asOrderedCollection ].
	30 -> 1
		in: [ :assoc | 
			| start end |
			start := assoc key.
			end := assoc value.
			self
				assert: (start srfi41CountBackward next: start)
				equals: (start to: end by: -1)
				modulo: #asOrderedCollection ]