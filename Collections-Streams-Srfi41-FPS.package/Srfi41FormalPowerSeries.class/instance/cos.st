as yet unclassified
cos
	| Y |
	Y := nil.
	Y := ([ 1 ] srfi41Cons: [ self sin integral negated stream ])
		asFPS.
	^ Y