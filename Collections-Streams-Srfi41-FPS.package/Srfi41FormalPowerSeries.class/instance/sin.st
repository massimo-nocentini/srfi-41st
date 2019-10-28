as yet unclassified
sin
	| Y |
	Y := nil.
	Y := ([ 0 ] srfi41Cons: [ self cos integral stream ]) asFPS.
	^ Y