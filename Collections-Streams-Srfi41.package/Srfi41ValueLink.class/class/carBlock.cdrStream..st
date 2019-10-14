as yet unclassified
carBlock: aBlock cdrStream: aStream
	^ Srfi41ValueLink new
		value: aBlock srfi41Delay;
		nextLink: aStream ;
		srfi41Stream