as yet unclassified
carBlock: aBlock cdrBlock: dBlock
	^ Srfi41ValueLink new
		value: aBlock srfi41Delay;
		nextLink: dBlock srfi41Stream;
		srfi41Stream