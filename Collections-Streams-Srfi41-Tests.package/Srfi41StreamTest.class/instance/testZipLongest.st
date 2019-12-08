tests
testZipLongest
	self
		assert:
			(#(1 2 3) asSrfi41Stream
				zipLongest: #(1 2 3 4 5) asSrfi41Stream
				with: [ :f :s :isSentinel | 
					(isSentinel value: f)
						ifTrue: [ s ]
						ifFalse: [ f + s ] ])
		equals: #(2 4 6 4 5)
		modulo: #asOrderedCollection