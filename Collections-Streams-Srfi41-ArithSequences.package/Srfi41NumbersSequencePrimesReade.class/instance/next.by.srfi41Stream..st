evaluating
next: aBase by: aMult srfi41Stream: aStream
	| car |
	car := aStream car.
	^ aMult < car
		ifTrue: [ self next: aBase by: aBase + aMult srfi41Stream: aStream ]
		ifFalse: [ | cdr |
			cdr := aStream cdr.
			car < aMult
				ifTrue:
					[ [ car ] srfi41Cons: [ self next: aBase by: aMult srfi41Stream: cdr ] ]
				ifFalse: [ self next: aBase by: aBase + aMult srfi41Stream: cdr ] ]