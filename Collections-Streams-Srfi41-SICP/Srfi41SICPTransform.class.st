"
I am the abstract superclass of the transformations of a stream, the argument of `transform:` and `accelerate:` of `Srfi41SICPStream`. `value: aStream` answers the stream of the `headOf:` of `aStream`, of its tail, of the tail of its tail, and so on. My subclasses implement `headOf:`.
"
Class {
	#name : #Srfi41SICPTransform,
	#superclass : #Object,
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #accessing }
Srfi41SICPTransform >> headOf: stream [

	self subclassResponsibility
]

{ #category : #accessing }
Srfi41SICPTransform >> value: stream [

	^ (self headOf: stream) >~ [ self value: stream tail ]
]
