evaluating
sieveSrfi41Stream: aStream
	| car |
	car := aStream car.
	^ [ car ]
		~ [ self sieveSrfi41Stream: (self sift: car srfi41Stream: aStream cdr) ]