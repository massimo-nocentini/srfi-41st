*Collections-Streams-Srfi41
srfi41Iter: x
	^ [ x ] srfi41Cons: [ self srfi41Iter: (self value: x) ]