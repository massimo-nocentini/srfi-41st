evaluating
definition
	| lucas |
	lucas := nil.
	lucas := [ 2 ]
		srfi41Cons: [ [ 1 ] srfi41Cons: (self cdrBlock: lucas) ].
	^ lucas