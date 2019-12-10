*Collections-Streams-Srfi41
>>~ aStream
	^ [ aStream
			ifEmpty: #yourself
			ifNotEmpty: [ [ self value: aStream car ] srfi41Stream + (self >>~ aStream cdr) ] ]
		srfi41Stream

	"	^ (aStream collect: self) dovetailCounterClockwise concat"