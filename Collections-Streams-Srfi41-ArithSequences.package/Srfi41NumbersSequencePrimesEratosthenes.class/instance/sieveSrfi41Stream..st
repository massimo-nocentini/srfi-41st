evaluating
sieveSrfi41Stream: aStream
	| car |
	car := aStream car.
	^ [ car ]
		srfi41Cons: [ self
				sieveSrfi41Stream: (aStream cdr select: [ :each | (each rem: car) isZero not ]) ]