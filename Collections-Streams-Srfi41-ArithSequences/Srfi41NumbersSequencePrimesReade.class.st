Class {
	#name : #Srfi41NumbersSequencePrimesReade,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequencePrimesReade >> definition [
	^ self sieveSrfi41Stream: 2 srfi41CountForward
]

{ #category : #evaluating }
Srfi41NumbersSequencePrimesReade >> next: aBase by: aMult srfi41Stream: aStream [
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
]

{ #category : #evaluating }
Srfi41NumbersSequencePrimesReade >> sieveSrfi41Stream: aStream [
	| car |
	car := aStream car.
	^ [ car ]
		srfi41Cons: [ self sieveSrfi41Stream: (self sift: car srfi41Stream: aStream cdr) ]
]

{ #category : #evaluating }
Srfi41NumbersSequencePrimesReade >> sift: aBase srfi41Stream: aStream [
	^ self next: aBase by: 2 * aBase srfi41Stream: aStream
]
