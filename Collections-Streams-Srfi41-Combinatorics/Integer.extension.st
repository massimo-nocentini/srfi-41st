Extension { #name : #Integer }

{ #category : #'*Collections-Streams-Srfi41-Combinatorics' }
Integer >> catalan [
	^ (2 * self choose: self) / (self + 1)
]
