tests
testSize
	self assert: {} asSrfi41Stream size equals: 0.
	self
		assert: ([ 1 / 0 ] srfi41Cons: [ {} asSrfi41Stream ]) size
		equals: 1.	
			
			"10 is just a number; pick another number, any number..."
	(1 to: 10)
		in: [ :range | self assert: range asSrfi41Stream size equals: range size ]