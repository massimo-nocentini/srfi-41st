as yet unclassified
derivative
	^ [ self cdr
		elementwiseFPS: (1 srfi41CountForward asFPSof: self var)
		do: #* ] srfi41StreamFPSof: self var