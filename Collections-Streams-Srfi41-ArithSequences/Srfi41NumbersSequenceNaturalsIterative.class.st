"
I am the stream of the natural numbers from 0, made by the iteration of a block that adds one (`srfi41Iter`).
"
Class {
	#name : #Srfi41NumbersSequenceNaturalsIterative,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceNaturalsIterative >> definition [
 ^ [ [ :x | x + 1 ] srfi41Iter value: 0 ] srfi41Stream
]
