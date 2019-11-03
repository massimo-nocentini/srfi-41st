tests
testPascal
	self
		assert:
			([ 1 asFPS ]
				srfi41Cons: [ [ {1 . 1} asFPS negated ]
						srfi41Cons: [ 0 srfi41Repeat collect: #asFPS ] ]) asFPS
				reciprocal
		equals:([ 1 asFPS ]
				srfi41Cons: [ [ {1 . 1} asFPS negated ]
						srfi41Cons: [ 0 srfi41Repeat collect: #asFPS ] ]) asFPS
				reciprocal
		upto: 10
		modulo: [ :rows | 
			(rows collect: [ :row | (row stream next: 10) asOrderedCollection ])
				asOrderedCollection ]