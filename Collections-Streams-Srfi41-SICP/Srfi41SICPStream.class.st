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

{ #category : #auxiliary }
Srfi41SICPStream class >> cesaro [

	^ (self random: (RandomInteger new
			    atLeast: 2;
			    atMost: Character maxVal;
			    yourself)) adjacentPairs collect: [ :pair |
		  (pair first gcd: pair second) = 1 ]
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> collect: block init: init [

	^ self head: init tail: [ :stream | stream collect: block ]
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> constant: k [

	^ self head: k tail: [ :stream | stream ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> cos [

	^ self head: 1 tail: [ self sin negated integrate ]
]

{ #category : #creating }
Srfi41SICPStream class >> empty [

	^ EmptyStream
]

{ #category : #auxiliary }
Srfi41SICPStream class >> exponential [

	^ self exponential: 1
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> exponential: unit [

	^ self head: unit tail: [ :exp | exp integrate ]
]

{ #category : #creating }
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

{ #category : #'creating - high order' }
Srfi41SICPStream class >> iterate: block init: init [

	^ self
		  head: init
		  tail: [ self iterate: block init: (block value: init) ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> naturals [

	^ self collect: [ :each | each + 1 ] init: 0
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> random: random [

	^ self
		  head: random next
		  tail: [ :stream | stream collect: [ :each | random next ] ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> sin [

	^ self head: 0 tail: [ self cos integrate ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> tan [

	^ self sin / self cos
]

{ #category : #multiply }
Srfi41SICPStream >> * another [

	^ another multiplyFrom: self
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

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> accelerate: block [

	^ (self tableau: block) collect: [ :stream | stream head ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> adaptToNumber: aNumber andSend: aSelector [

	^ (self class constant: aNumber)
		  zip: self
		  with: [ :a :b | a perform: aSelector with: b ]
]

{ #category : #tupling }
Srfi41SICPStream >> adjacentOverlappingPairs [

	^ self tuplesOfSize: 2 overlapping: true
]

{ #category : #tupling }
Srfi41SICPStream >> adjacentPairs [

	^ self tuplesOfSize: 2 overlapping: false
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

{ #category : #simulation }
Srfi41SICPStream >> montecarlo [

	^ self montecarlo: [ :each | true = each ]
]

{ #category : #simulation }
Srfi41SICPStream >> montecarlo: predicate [

	^ self montecarlo: predicate successes: 0 failures: 0
]

{ #category : #simulation }
Srfi41SICPStream >> montecarlo: predicate successes: s failures: f [

	| ss ff |
	ss := s.
	ff := f.

	(predicate value: self head)
		ifTrue: [ ss := ss + 1 ]
		ifFalse: [ ff := ff + 1 ].

	^ self class
		  head: ss / (ss + ff)
		  tail: [
		  self tail montecarlo: predicate successes: ss failures: ff ]
]

{ #category : #multiply }
Srfi41SICPStream >> multiplyFrom: client [

	^ client multiply_Srfi41SICPStream: self
]

{ #category : #multiply }
Srfi41SICPStream >> multiply_Number: factor [

	^ self collect: [ :each | each * factor ]
]

{ #category : #multiply }
Srfi41SICPStream >> multiply_Srfi41SICPStream: another [

	| h |
	h := self head.

	^ self class
		  head: h * another head
		  tail: [ h * another tail + (self tail * another) ]
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

	^ self class
		  head: unit / self head
		  tail: [ :reciprocal |
		  self tail * reciprocal * self head reciprocal negated ]
]

{ #category : #enumerating }
Srfi41SICPStream >> select: predicate [

	| h |
	h := self head.

	^ (predicate value: h)
		  ifTrue: [
		  self class head: h tail: [ self tail select: predicate ] ]
		  ifFalse: [ self tail select: predicate ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> tableau: block [

	^ self class iterate: block init: self
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

{ #category : #enumerating }
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

{ #category : #enumerating }
Srfi41SICPStream >> transform: block [

	^ block value: self
]

{ #category : #tupling }
Srfi41SICPStream >> tuplesOfSize: size overlapping: shouldOverlap [

	^ size > 0
		  ifTrue: [
			  | rest tuple |
			  tuple := Array new: size.

			  rest := self.

			  1 to: size - 1 do: [ :i |
				  tuple at: i put: rest head.
				  rest := rest tail ].

			  tuple at: size put: rest head.

			  self class head: tuple tail: [
				  (shouldOverlap
					   ifTrue: [ self ]
					   ifFalse: [ rest ]) tail
					  tuplesOfSize: size
					  overlapping: shouldOverlap ] ]
		  ifFalse: [ self class constant: {  } ]
]

{ #category : #combinators }
Srfi41SICPStream >> zip: stream with: block [

	^ self class
		  head: (block value: self head value: stream head)
		  tail: [ self tail zip: stream tail with: block ]
]
