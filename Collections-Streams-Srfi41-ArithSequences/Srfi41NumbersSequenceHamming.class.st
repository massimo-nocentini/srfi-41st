Class {
	#name : #Srfi41NumbersSequenceHamming,
	#superclass : #Srfi41NumbersSequenceFluents,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceHamming >> primes [
	^ super primes next: 3
]
