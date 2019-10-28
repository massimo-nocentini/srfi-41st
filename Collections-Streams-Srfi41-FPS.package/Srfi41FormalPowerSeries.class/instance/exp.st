as yet unclassified
exp
	| Y |
	Y := nil.
	Y := ([ 1 ] srfi41Cons: [ Y integral stream ]) asFPS.
	^ Y