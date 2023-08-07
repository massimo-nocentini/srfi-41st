Class {
	#name : #Srfi41SICPEmptyStream,
	#superclass : #Srfi41SICPStream,
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #enumerating }
Srfi41SICPEmptyStream >> collect: block [

	^ self
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> head [

	Error signal: 'An empty stream hasn''t a head.'
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> head: anObject [

	^ Srfi41SICPStream head: anObject tail: [ self ]
]

{ #category : #converting }
Srfi41SICPEmptyStream >> putOnStream: collection [
	"Being a method without code allows me to stop the recursion"

	
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> tail [

	^ self
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> tail: valuable [

	Error signal: 'Cannot build a stream without a head.'
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> take: size [

	^ self
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> zip: stream with: block [

	^ self
]
