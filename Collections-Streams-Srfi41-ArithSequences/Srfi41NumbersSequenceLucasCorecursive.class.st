"
I am the stream of the Lucas numbers, 2 1 3 4 7 11 and so on: the recurrence is that of the Fibonacci numbers, from 2 and 1.
"
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
