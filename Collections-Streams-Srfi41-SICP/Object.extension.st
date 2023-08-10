Extension { #name : #Object }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
Object >> >~ block [

	^ Srfi41SICPStream head: self tail: block
]
