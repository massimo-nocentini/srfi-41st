as yet unclassified
derivative
	^ [ self cdr elementwiseFPS: 1 srfi41CountForward asFPS do: #* ]
		srfi41StreamFPS