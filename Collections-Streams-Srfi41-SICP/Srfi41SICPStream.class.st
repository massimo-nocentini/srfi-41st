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

	^ init >~ [ :stream | stream collect: block ]
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> constant: k [

	^ k >~ [ :stream | stream ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> cos [

	^ 1 >~ [ self sin negated integrate ]
]

{ #category : #creating }
Srfi41SICPStream class >> empty [

	^ EmptyStream
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> evenNaturals [

	^ self collect: [ :each | each + 2 ] init: 0
]

{ #category : #auxiliary }
Srfi41SICPStream class >> exponential [

	^ self exponential: 1
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> exponential: unit [

	^ unit >~ [ :exp | exp integrate ]
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

	^ init >~ [ self iterate: block init: (block value: init) ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> naturals [

	^ self collect: [ :each | each + 1 ] init: 0
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream class >> oddNaturals [

	^ self collect: [ :each | each + 2 ] init: 1
]

{ #category : #'creating - high order' }
Srfi41SICPStream class >> random: random [

	^ random next
	  >~ [ :stream | stream collect: [ :each | random next ] ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> sin [

	^ 0 >~ [ self cos integrate ]
]

{ #category : #auxiliary }
Srfi41SICPStream class >> tan [

	^ self sin / self cos
]

{ #category : #multiply }
Srfi41SICPStream >> * another [

	| h |
	h := self head.

	^ h * another head >~ [
	  (another tail collect: [ :each | h * each ])
	  + (self tail * another) ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> + another [

	^ self zip: another with: [ :r :s | r + s ]
]

{ #category : #appending }
Srfi41SICPStream >> , another [

	^ another appendedOn_Srfi41SICPStream: self
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

{ #category : #tupling }
Srfi41SICPStream >> adjacentOverlappingPairs [

	^ self tuplesOfSize: 2 overlapping: true
]

{ #category : #tupling }
Srfi41SICPStream >> adjacentPairs [

	^ self tuplesOfSize: 2 overlapping: false
]

{ #category : #appending }
Srfi41SICPStream >> append_BlockClosure: block [

	^ self head >~ [ self tail append_BlockClosure: block ]
]

{ #category : #appending }
Srfi41SICPStream >> append_Srfi41SICPStream: suffix [

	^ self head >~ [ self tail append_Srfi41SICPStream: suffix ]
]

{ #category : #appending }
Srfi41SICPStream >> appendedOn_Srfi41SICPStream: prefix [

	^ prefix append_Srfi41SICPStream: self
]

{ #category : #converting }
Srfi41SICPStream >> asArray [

	^ Array streamContents: [ :stream | self putOnStream: stream ]
]

{ #category : #accessing }
Srfi41SICPStream >> at: position [

	^ position > 0
		  ifTrue: [
			  | stream |
			  stream := self.

			  position - 1 timesRepeat: [ stream := stream tail ].

			  stream head ]
		  ifFalse: [
		  Error signal: 'Cannot reference a non-positive position.' ]
]

{ #category : #enumerating }
Srfi41SICPStream >> collect: block [

	^ (block value: self head) >~ [ self tail collect: block ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> concatenate [

	^ self head concatenateFrom: self
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> concatenateFrom: container [

	^ self head >~ [ (self tail >~ [ container tail ]) concatenate ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> enumerate [

	^ self enumerate: 1
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> enumerate: i [

	^ i -> self head >~ [ self tail enumerate: i + 1 ]
]

{ #category : #converting }
Srfi41SICPStream >> hasEvaluatedTail [

	^ tail hasBeenEvaluated
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

{ #category : #converting }
Srfi41SICPStream >> interleave: another [

	^ self head >~ [ another interleave: self tail ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> intersperse: obj [

	^ obj >~ [ self ] >~ [  ] , [
	  (self tail intersperse: obj) collect: [ :stream |
		  self head >~ [ stream ] ] ]
]

{ #category : #converting }
Srfi41SICPStream >> justEvaluatedPrefix [

	^ Array streamContents: [ :writer |
		  | stream |
		  stream := self.

		  [
		  writer nextPut: stream head.
		  stream hasEvaluatedTail ] whileTrue: [ stream := stream tail ] ]
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

	^ ss / (ss + ff)
	  >~ [ self tail montecarlo: predicate successes: ss failures: ff ]
]

{ #category : #arithmetic }
Srfi41SICPStream >> negated [

	^ self collect: #negated
]

{ #category : #converting }
Srfi41SICPStream >> pairs: another [

	^ self pairs: another with: [ :a :b | Array with: a with: b ]
]

{ #category : #converting }
Srfi41SICPStream >> pairs: another with: block [

	| h |
	h := self head.

	^ (block value: h value: another head) >~ [
	  | row triangle anotherTail |
	  anotherTail := another tail.

	  row := anotherTail collect: [ :each | block value: h value: each ].

	  triangle := self tail pairs: anotherTail with: block.

	  row interleave: triangle ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> partial: block [

	^ self head >~ [ self tail partial: block init: self head ]
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> partial: block init: init [

	| stream |
	stream := nil.

	stream := init >~ [ stream ] zip: self with: block.

	^ stream
]

{ #category : #'as yet unclassified' }
Srfi41SICPStream >> permutations [

	^ (self tail permutations collect: [ :stream |
		   stream intersperse: self head ]) concatenate
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

	^ unit / self head >~ [ :reciprocal |
	  self tail * reciprocal collect: [ :each | each negated / self head ] ]
]

{ #category : #enumerating }
Srfi41SICPStream >> select: predicate [

	| h |
	h := self head.

	^ (predicate value: h)
		  ifTrue: [ h >~ [ self tail select: predicate ] ]
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
				           ifTrue: [ [  ] ]
				           ifFalse: [ [ self tail take: size - 1 ] ].

			  self head >~ block ]
		  ifFalse: [ {  } asSrfi41SICPStream ]
]

{ #category : #enumerating }
Srfi41SICPStream >> transform: valuable [

	^ valuable value: self
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

			  tuple >~ [
			  | stream |
			  stream := shouldOverlap
				            ifTrue: [ self ]
				            ifFalse: [ rest ].

			  stream tail tuplesOfSize: size overlapping: shouldOverlap ] ]
		  ifFalse: [ self class constant: {  } ]
]

{ #category : #combinators }
Srfi41SICPStream >> zip: stream with: block [

	^ (block value: self head value: stream head)
	  >~ [ self tail zip: stream tail with: block ]
]
