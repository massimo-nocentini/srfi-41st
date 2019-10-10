*Collections-Streams-Srfi41-Extensions
srfi41CountBy: anInteger
	^ [ [ self ] srfi41Cons: [self + anInteger srfi41CountBy: anInteger] ]srfi41Stream 