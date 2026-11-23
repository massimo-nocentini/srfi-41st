"
I am the stream of the triangular numbers, 0 1 3 6 10 and so on: the partial sums of the positive integers, from 0.
"
Class {
	#name : #Srfi41NumbersSequenceTriangular,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceTriangular >> definition [
	^ 1 srfi41CountForward scan: #+ initBlock: [0]
]
