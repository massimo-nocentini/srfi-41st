tests
testFundamentalCheck
	"Even streams are more complex than odd streams in both definition and usage, but they offer a strong benefit: they fix the off-by-one error of odd streams. Wadler, Taha and MacQueen show, for instance, that an expression like (stream->list 4 (stream-map / (stream-from 4 -1))) evaluates to (1/4 1/3 1/2 1) using even streams but fails with a divide-by-zero error using odd streams, because the next element in the stream, which will be 1/0, is evaluated before it is accessed. This extra bit of laziness is not just an interesting oddity; it is vitally critical in many circumstances, as will become apparent below."

	self
		assert:
			(((4 to: -10 by: -1) asSrfi41Stream collect: [ :each | 1 / each ])
				next: 4) 
		equals:
			{(1 / 4).
			(1 / 3).
			(1 / 2).
			1} 
			modulo: #asOrderedCollection