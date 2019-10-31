evaluating
cdrBlock: fibs
	^ [ fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ]