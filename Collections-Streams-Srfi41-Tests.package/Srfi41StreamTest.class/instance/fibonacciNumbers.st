tests
fibonacciNumbers
	| fibs |
	fibs := [ 0 ]
		~
			[ [ 1 ] ~ [ fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ] ].
	^ fibs