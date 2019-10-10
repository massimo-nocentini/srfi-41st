*Collections-Streams-Srfi41-ArithSequences
srfi41FibonacciNumbers
	| fibs |
	fibs := nil.
	fibs := [ self ]
		~ [ [ self + 1 ] ~ [ fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ] ].
	^ fibs