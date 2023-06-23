Class {
	#name : #Srfi41NumbersSequenceFactorial,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceFactorial >> definition [
	^ 1 srfi41CountForward scan: #* initBlock: [ 1 ]
]
