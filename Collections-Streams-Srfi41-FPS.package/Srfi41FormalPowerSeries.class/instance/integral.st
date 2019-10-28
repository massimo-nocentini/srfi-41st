as yet unclassified
integral
	^ [ [ 0 ]
		srfi41Cons: [ self stream zip: 1 srfi41CountForward with: #/ ] ]
		srfi41Stream asFPS