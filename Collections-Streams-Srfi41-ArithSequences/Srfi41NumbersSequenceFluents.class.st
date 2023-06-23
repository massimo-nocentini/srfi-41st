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
