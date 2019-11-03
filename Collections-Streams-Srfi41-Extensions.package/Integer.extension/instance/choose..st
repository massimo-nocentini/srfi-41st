*Collections-Streams-Srfi41-Extensions
choose: k
	^ self >= k
		ifTrue: [ self factorial / (k factorial * (self - k) factorial) ]
		ifFalse: [ 0 ]