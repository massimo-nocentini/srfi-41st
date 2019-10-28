as yet unclassified
integral
	^ [ self stream zip: 1 srfi41CountForward with: #/ ] srfi41Stream
		asFPS