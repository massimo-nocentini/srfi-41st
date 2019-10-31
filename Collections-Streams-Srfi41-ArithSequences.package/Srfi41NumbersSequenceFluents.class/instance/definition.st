evaluating
definition
	| fluents |
	fluents := nil.
	fluents := [ 1 ]
		srfi41Cons: [ ((self primes
				collect: [ :aPrime | fluents collect: [ :each | aPrime * each ] ])
				mergeWithSortBlock: #<) nextUnless: #= ].
	^ fluents