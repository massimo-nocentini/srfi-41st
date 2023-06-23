Class {
	#name : #Srfi41NumbersSequencePrimesEratosthenes,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequencePrimesEratosthenes >> definition [
	^ 2 srfi41CountForward
		nextUnless:#isDivisibleBy:
]
