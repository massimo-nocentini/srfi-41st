*Collections-Streams-Srfi41-Combinatorics
choose: k
	^ (k positive and: [ self >= k ])
		ifTrue: [ self factorial / (k factorial * (self - k) factorial) ]
		ifFalse: [ 0 ]