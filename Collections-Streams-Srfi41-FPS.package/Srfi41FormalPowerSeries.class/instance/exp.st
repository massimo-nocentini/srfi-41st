as yet unclassified
exp
	"^ [ 1 asFPS + self exp integral ] srfi41StreamFPS"

	| Y |
	Y := nil.
	Y := [ 1 + Y integral ] srfi41StreamFPSof: self var.
	^ Y