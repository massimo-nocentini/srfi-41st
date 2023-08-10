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
