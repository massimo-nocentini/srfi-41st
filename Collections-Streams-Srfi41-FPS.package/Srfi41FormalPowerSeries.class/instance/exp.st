as yet unclassified
exp
	| Y |
	Y := nil.
	Y := [ 1 asFPS + Y integral ] srfi41StreamFPS.
	^ Y