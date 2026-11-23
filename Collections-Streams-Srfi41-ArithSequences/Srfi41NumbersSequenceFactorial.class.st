"
I am the stream of the factorials, from that of 0: the partial products of the positive integers, with `scan:initBlock:`.
"
Class {
	#name : #Srfi41NumbersSequenceFactorial,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceFactorial >> definition [
	^ 1 srfi41CountForward scan: #* initBlock: [ 1 ]
]
