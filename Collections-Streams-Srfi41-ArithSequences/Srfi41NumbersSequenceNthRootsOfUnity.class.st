"
I am the stream whose nth element, counting from 1, is the array of the n complex roots of unity of order n. They are the powers, from 0 to n - 1, of e raised to 2πi / n, computed with floats.
"
Class {
	#name : #Srfi41NumbersSequenceNthRootsOfUnity,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceNthRootsOfUnity >> definition [
	^ 1 srfi41CountForward
		collect: [ :n | 
			| w |
			w := Float e ** (2 * Float pi / n) i.
			(0 to: n - 1) collect: [ :j | w raisedToInteger: j ] ]
]
