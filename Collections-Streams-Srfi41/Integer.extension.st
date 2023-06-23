Extension { #name : #Integer }

{ #category : #'*Collections-Streams-Srfi41' }
Integer >> srfi41At: aStream [
	^ aStream atInteger: self
]
