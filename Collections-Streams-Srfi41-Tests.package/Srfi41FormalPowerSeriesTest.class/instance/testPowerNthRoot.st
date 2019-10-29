tests
testPowerNthRoot
	self
		assert: (1 asFPS - #t asFPS) reciprocal ** (3 / 2)
		equals:
			{1.
			(3 / 2).
			(15 / 8).
			(35 / 16).
			(315 / 128).
			(693 / 256).
			(3003 / 1024).
			(6435 / 2048).
			(109395 / 32768).
			(230945 / 65536).
			(969969 / 262144).
			(2028117 / 524288).
			(16900975 / 4194304).
			(35102025 / 8388608).
			(145422675 / 33554432)} asFPS
		upto: 15
		modulo: #asOrderedCollection