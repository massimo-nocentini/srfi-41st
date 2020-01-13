*Collections-Streams-Srfi41
carBlock: aBlock cdrStream: aStream
	^ self new
		value: aBlock srfi41Delay;
		nextLink: aStream;
		srfi41Stream