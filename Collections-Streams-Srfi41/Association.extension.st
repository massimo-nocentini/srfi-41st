Extension { #name : #Association }

{ #category : #'*Collections-Streams-Srfi41' }
Association >> ifEager: eBlock ifLazy: lBlock [
	^ (self key
		   ifTrue: [ eBlock ]
		   ifFalse: [ lBlock ]) cull: self value
]

{ #category : #'*Collections-Streams-Srfi41' }
Association class >> srfi41Eager: anObject [
	^ self key: true value: anObject
]

{ #category : #'*Collections-Streams-Srfi41' }
Association class >> srfi41Lazy: aBlock [
	^ self key: false value: aBlock
]
