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

	^ self head: head tailWithWholeStream: [ :stream | valuable value ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> head: head tailWithWholeStream: valuable [

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
Srfi41SICPStream >> asArray [

	^ Array streamContents: [ :stream | self putOnStream: stream ]
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

{ #category : #converting }
Srfi41SICPStream >> putOnStream: aStream [

	aStream nextPut: self head.

	self tail putOnStream: aStream
]

{ #category : #accessing }
Srfi41SICPStream >> tail [

	^ tail valueFor: self
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
