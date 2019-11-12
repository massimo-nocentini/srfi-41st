*Collections-Streams-Srfi41-Combinatorics
catalan: k
	^ (2 * self - k choose: self - k)
		- (2 * self - k choose: self - k - 1)