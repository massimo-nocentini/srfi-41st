Class {
	#name : #Srfi41SICPStream,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#classVars : [
		'EmptyStream'
	],
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #requirements }
Srfi41SICPStream class >> empty [

	^ EmptyStream
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> head: head tail: valuable [

	^ self new
		  head: head;
		  tail: valuable;
		  yourself
]

{ #category : #'class initialization' }
Srfi41SICPStream class >> initialize [

	EmptyStream := Srfi41SICPEmptyStream new
]

{ #category : #converting }
Srfi41SICPStream >> appendIntoOrderedCollection: collection [

	collection add: self head.

	self tail appendIntoOrderedCollection: collection
]

{ #category : #converting }
Srfi41SICPStream >> asOrderedCollection [

	| collection |
	collection := OrderedCollection new.

	self appendIntoOrderedCollection: collection.

	^ collection
]

{ #category : #enumerating }
Srfi41SICPStream >> collect: block [

	^ self class
		  head: (block value: self head)
		  tail: [ self tail collect: block ]
]

{ #category : #accessing }
Srfi41SICPStream >> head [

	^ head
]

{ #category : #accessing }
Srfi41SICPStream >> head: anObject [

	head := anObject
]

{ #category : #accessing }
Srfi41SICPStream >> tail [

	^ tail value
]

{ #category : #accessing }
Srfi41SICPStream >> tail: valuable [

	tail := Srfi41UnitValuableMemoizer new
		        valuable: valuable;
		        yourself
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> take: size [

	^ self class head: self head tail: (size == 1
			   ifTrue: [ [ EmptyStream ] ]
			   ifFalse: [ [ self tail take: size - 1 ] ])
]

{ #category : #combinators }
Srfi41SICPStream >> zip: stream with: block [

	^ self class
		  head: (block value: self head value: stream head)
		  tail: [ self tail zip: stream tail with: block ]
]
