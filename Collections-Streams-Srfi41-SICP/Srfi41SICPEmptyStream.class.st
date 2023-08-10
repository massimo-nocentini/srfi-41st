Class {
	#name : #Srfi41SICPEmptyStream,
	#superclass : #Srfi41SICPStream,
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #appending }
Srfi41SICPEmptyStream >> append_BlockClosure: block [

	^ block value
]

{ #category : #appending }
Srfi41SICPEmptyStream >> append_Srfi41SICPStream: suffix [

	^ suffix
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> at: position [

	Error signal: 'Cannot reference a position an empty stream.'
]

{ #category : #enumerating }
Srfi41SICPEmptyStream >> collect: block [

	^ self
]

{ #category : #'as yet unclassified' }
Srfi41SICPEmptyStream >> concatenate [

	^ self
]

{ #category : #'as yet unclassified' }
Srfi41SICPEmptyStream >> concatenateFrom: container [

	^ container tail concatenate
]

{ #category : #'as yet unclassified' }
Srfi41SICPEmptyStream >> enumerate: i [

	^ self
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> head [

	Error signal: 'An empty stream hasn''t a head.'
]

{ #category : #accessing }
Srfi41SICPEmptyStream >> head: anObject [

	^ anObject >~ [ self ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPEmptyStream >> intersperse: obj [

	^ obj >~ [  ] >~ [  ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPEmptyStream >> permutations [

	^ self >~ [  ]
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
