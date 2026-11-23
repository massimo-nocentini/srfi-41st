"
I am the stream of the Hamming numbers, 1 2 3 4 5 6 8 9 10 12 and so on, those with no prime factor greater than 5: my `primes` are the first three, 2, 3 and 5.
"
Class {
	#name : #Srfi41NumbersSequenceHamming,
	#superclass : #Srfi41NumbersSequenceFluents,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceHamming >> primes [
	^ super primes next: 3
]
