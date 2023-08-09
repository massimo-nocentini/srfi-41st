Extension { #name : #BlockClosure }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
BlockClosure >> transform [

	| transformed |
	transformed := nil.

	transformed := [ :stream |
	               Srfi41SICPStream
		               head: (self value: stream)
		               tail: [ transformed value: stream tail ] ].

	^ transformed
]
