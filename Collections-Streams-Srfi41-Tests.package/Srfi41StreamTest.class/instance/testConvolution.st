tests
testConvolution
	30
		in: [ :n | 
			self
				assert:
					(([ 1 ] srfi41Repeat
						convolution: [ 1 ] srfi41Repeat
						f: #*
						combiner: [ :a :b | a zip: b with: #+ ]) next: n)
				equals: (1 to: n)
				modulo: #asOrderedCollection.
			self
				assert:
					(([ 1 ] srfi41Repeat
						convolution: #(1 -1) asSrfi41Stream , [ 0 ] srfi41Repeat
						f: #*
						combiner: [ :a :b | a zip: b with: #+ ]) next: n)
				equals: #(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
				modulo: #asOrderedCollection ]