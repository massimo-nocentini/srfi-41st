tests
testPascal
	self
		assert:
			{{1} asFPS.
			{1 . 1} asFPS negated} asFPS reciprocal
		equals: #(1 1 2 3 5 8 13 21 34 55 89 144 233 377 610) asFPS
		upto: 15
		modulo: [ :fps | 
			(fps next: 10) asOrderedCollection
				collect: [ :ffps | 
					ffps isInteger
						ifTrue: [ self halt. OrderedCollection with: ffps ]
						ifFalse: [ (ffps stream next: 10) asOrderedCollection ] ] ]