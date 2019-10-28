as yet unclassified
integralWithConstantBlock: aBlock
	^ (aBlock
		srfi41Cons: [ self stream zip: 1 srfi41CountForward with: #/ ])
		asFPS