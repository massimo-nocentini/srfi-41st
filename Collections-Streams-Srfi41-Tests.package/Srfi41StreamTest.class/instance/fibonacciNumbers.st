tests
fibonacciNumbers
	| fibs |
	fibs := [ 0 ]
		srfi41Cons:  [ [ 1 ] srfi41Cons:  [ fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ] ].
	^ fibs