as yet unclassified
exp
	"^ [ 1 asFPS + self exp integral ] srfi41StreamFPS"

	| Y |
	Y := nil.
	Y := [ 1 asFPS + Y integral ] srfi41StreamFPS.
	^ Y