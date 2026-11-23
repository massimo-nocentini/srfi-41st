"
I am the stream of the natural numbers from 0, defined in terms of itself: after 0, the stream increased by one.
"
Class {
	#name : #Srfi41NumbersSequenceNaturalsCorecursive,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #accessing }
Srfi41NumbersSequenceNaturalsCorecursive >> definition [
	| nats |
	nats := nil.
	nats := [ 0 ] srfi41Cons: [ nats collect: #increase ].
	^ nats
]
