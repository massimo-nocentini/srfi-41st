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

{ #category : #accessing }
Srfi41SICPStream class >> collect: block init: init [

	^ self head: init tail: [ :stream | stream collect: block ]
]

{ #category : #accessing }
Srfi41SICPStream class >> constant: k [

	^ self head: k tail: [ :stream | stream ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> cos [

	^ self head: 1 tail: [ self sin negated integrate ]
]

{ #category : #requirements }
Srfi41SICPStream class >> empty [

	^ EmptyStream
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> exponential [

	^ self exponential: 1
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> exponential: unit [

	^ self head: unit tail: [ :exp | exp integrate ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> head: head tail: valuable [

	^ self new
		  head: head;
		  tail: (valuable numArgs = 1
				   ifTrue: [ valuable ]
				   ifFalse: [ [ :stream | valuable value ] ]);
		  yourself
]

{ #category : #'class initialization' }
Srfi41SICPStream class >> initialize [

	EmptyStream := Srfi41SICPEmptyStream new
]

{ #category : #accessing }
Srfi41SICPStream class >> naturals [

	^ self collect: [ :each | each + 1 ] init: 0
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> sin [

	^ self head: 0 tail: [ self cos integrate ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> tan [

	^ self sin / self cos
]

{ #category : #arithmetic }
Srfi41SICPStream >> * another [

	| h |
	h := self head.

	^ self class head: h * another head tail: [
		  (another tail collect: [ :each | h * each ])
		  + (self tail * another) ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> + another [

	^ self zip: another with: [ :r :s | r + s ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> - another [

	^ self zip: another with: [ :r :s | r - s ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> / another [

	^ self * another reciprocal
]

{ #category : #arithmetic }
Srfi41SICPStream >> << factor [

	^ self collect: [ :each | each * factor ]
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

{ #category : #arithmetic }
Srfi41SICPStream >> integrate [

	^ self zip: self class naturals tail with: [ :s :i | s / i ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> negated [

	^ self collect: #negated
]

{ #category : #converting }
Srfi41SICPStream >> putOnStream: aStream [

	aStream nextPut: self head.

	self tail putOnStream: aStream
]

{ #category : #arithmetic }
Srfi41SICPStream >> reciprocal [

	^ self reciprocal: 1
]

{ #category : #arithmetic }
Srfi41SICPStream >> reciprocal: unit [

	^ self class head: unit / self head tail: [ :reciprocal |
		  self tail * reciprocal << self head reciprocal negated ]
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

	^ size > 0
		  ifTrue: [
			  | block |
			  block := size == 1
				           ifTrue: [ [ self class empty ] ]
				           ifFalse: [ [ self tail take: size - 1 ] ].

			  self class head: self head tail: block ]
		  ifFalse: [ self class empty ]
]

{ #category : #combinators }
Srfi41SICPStream >> zip: stream with: block [

	^ self class
		  head: (block value: self head value: stream head)
		  tail: [ self tail zip: stream tail with: block ]
]
