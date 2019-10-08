*Collections-Streams-Srfi41
srfi41Iter
	"^ [ :x | [ x ] srfi41Cons: [ self srfi41Iter value: self value x ] ]
		srfi41Block"

	| block |
	block := [ :x | [ x ] srfi41Cons: [ block value: (self value: x) ] ]
		srfi41Block.
	^ block