Class {
	#name : #Srfi41NumbersSequenceFibonacciCorecursive,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceFibonacciCorecursive >> cdrBlock: fibs [
	^ [ fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ]
]

{ #category : #evaluating }
Srfi41NumbersSequenceFibonacciCorecursive >> definition [
	| fibs |
	fibs := nil.
	fibs := [ 0 ] srfi41Cons: [ [ 1 ] srfi41Cons: (self cdrBlock: fibs) ].
	^ fibs
]
