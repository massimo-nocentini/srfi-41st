tests
testCorrelation
	30
		in: [ :n | 
			| streamOfStreams |
			streamOfStreams := #(1 0 1 0 1) asSrfi41Stream
				autoCorrelationWithSimilarity: #=.
			self
				assert: (streamOfStreams collect: #asOrderedCollection)
				equals:
					(OrderedCollection new
						add: #(true true true true true);
						add: #(false false false false);
						add: #(true true true);
						add: #(false false);
						add: #(true);
						collect: #asOrderedCollection)
				modulo: #asOrderedCollection.
			self
				assert: (streamOfStreams collect: #and) asArray
				equals: #(true false true false true) ]