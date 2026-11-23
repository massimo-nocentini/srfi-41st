"
I am a stream that starts with 1 and goes on with the products of my own elements by the `primes`, merged in order and without repetitions.

My `primes` are all the prime numbers, and `mergeWithSortBlock:` needs every stream of products before it answers an element: only my first element, 1, can be computed, and asking for the next one does not end. My subclass `Srfi41NumbersSequenceHamming` uses finitely many primes.
"
Class {
	#name : #Srfi41NumbersSequenceFluents,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceFluents >> definition [
	| fluents |
	fluents := nil.
	fluents := [ 1 ]
		srfi41Cons: [ ((self primes
				collect: [ :aPrime | fluents collect: [ :each | aPrime * each ] ])
				mergeWithSortBlock: #<) nextUnless: #= ].
	^ fluents
]

{ #category : #evaluating }
Srfi41NumbersSequenceFluents >> primes [
	^ self class primesEratosthenes
]
