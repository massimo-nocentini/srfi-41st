evaluating
sieveSrfi41Stream: aStream
	| car |
	car := aStream car.
	^ [ car ]
		srfi41Cons: [ self sieveSrfi41Stream: (self sift: car srfi41Stream: aStream cdr) ]