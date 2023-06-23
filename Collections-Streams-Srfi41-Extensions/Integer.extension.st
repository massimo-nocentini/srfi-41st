Extension { #name : #Integer }

{ #category : #'*Collections-Streams-Srfi41-Extensions' }
Integer >> decrease [
	^  self - 1
]

{ #category : #'*Collections-Streams-Srfi41-Extensions' }
Integer >> increase [
	^ 1 + self
]
