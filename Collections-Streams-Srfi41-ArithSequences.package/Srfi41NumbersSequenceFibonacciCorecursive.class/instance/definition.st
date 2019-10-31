evaluating
definition
	| fibs |
	fibs := nil.
	fibs := [ 0 ] srfi41Cons: [ [ 1 ] srfi41Cons: (self cdrBlock: fibs) ].
	^ fibs