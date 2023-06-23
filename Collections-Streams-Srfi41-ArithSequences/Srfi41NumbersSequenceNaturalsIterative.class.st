Class {
	#name : #Srfi41NumbersSequenceNaturalsIterative,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceNaturalsIterative >> definition [
 ^ [ [ :x | x + 1 ] srfi41Iter value: 0 ] srfi41Stream
]
