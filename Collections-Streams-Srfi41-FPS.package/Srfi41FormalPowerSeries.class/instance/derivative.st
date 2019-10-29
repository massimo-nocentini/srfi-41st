as yet unclassified
derivative
	^ [ self cdr elementwiseFPS: 1 srfi41CountForward do: #* ]
		srfi41StreamFPS