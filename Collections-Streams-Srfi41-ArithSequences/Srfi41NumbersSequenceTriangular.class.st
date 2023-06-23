Class {
	#name : #Srfi41NumbersSequenceTriangular,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceTriangular >> definition [
	^ 1 srfi41CountForward scan: #+ initBlock: [0]
]
