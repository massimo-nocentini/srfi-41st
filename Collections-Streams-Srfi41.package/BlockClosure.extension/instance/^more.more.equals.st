*Collections-Streams-Srfi41
>>= aStream
	^ [ (aStream collect: self) dovetailCounterClockwise concat ]
		srfi41Stream