as yet unclassified
derivative
	^ [ self stream cdr zip: 1 srfi41CountForward with: #* ] srfi41Stream
		asFPS