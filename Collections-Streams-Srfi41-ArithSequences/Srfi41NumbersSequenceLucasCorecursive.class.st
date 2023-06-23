Class {
	#name : #Srfi41NumbersSequenceLucasCorecursive,
	#superclass : #Srfi41NumbersSequenceFibonacciCorecursive,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceLucasCorecursive >> definition [
	| lucas |
	lucas := nil.
	lucas := [ 2 ]
		srfi41Cons: [ [ 1 ] srfi41Cons: (self cdrBlock: lucas) ].
	^ lucas
]
