accessing
block: aBlock
	^ self promise: (Association srfi41Lazy: aBlock)