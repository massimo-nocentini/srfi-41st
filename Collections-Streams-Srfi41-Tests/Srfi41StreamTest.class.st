"
A Srfi41StreamTest is a test class for testing the behavior of Srfi41Stream
"
Class {
	#name : #Srfi41StreamTest,
	#superclass : #Srfi41AbstractTest,
	#category : 'Collections-Streams-Srfi41-Tests'
}

{ #category : #tests }
Srfi41StreamTest >> test123Stream [
	| aStream |
	aStream := [ 1 ]
		srfi41Cons: [ [ 2 ] srfi41Cons: [ [ 3 ] srfi41Cons: [ {} asSrfi41Stream ] ] ].
	self assert: aStream car equals: 1.
	self assert: aStream cadr equals: 2.
	self assert: aStream caddr equals: 3.
	self assert: aStream cdr cdr cdr isEmpty.
	self should: [ aStream cdr cdr cdr cdr ] raise: ShouldNotImplement
]

{ #category : #tests }
Srfi41StreamTest >> testAllButLast [
	self
		assert: {} asSrfi41Stream allButLast
		equals: OrderedCollection new allButLast
		modulo: #asOrderedCollection.
	(1 to: 10)
		in: [ :interval | 
			self
				assert: interval asSrfi41Stream allButLast
				equals: interval allButLast
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testAnd [
	self assert: {  } asSrfi41Stream and.
	self assert: { true. true. true } asSrfi41Stream and.
	self deny: { true. false. true } asSrfi41Stream and
]

{ #category : #tests }
Srfi41StreamTest >> testAppend [
	self
		assert: {} asSrfi41Stream , {} asSrfi41Stream
		equals: {}
		modulo: #asOrderedCollection.
	20
		in: [ :n | 
			self
				assert: (1 to: n) asSrfi41Stream , {} asSrfi41Stream
				equals: (1 to: n)
				modulo: #asOrderedCollection .
				self
				assert:{} asSrfi41Stream, (1 to: n) asSrfi41Stream
				equals: (1 to: n)
				modulo: #asOrderedCollection].
			
	20
		in: [ :n | 
			| split |
			split := (n / 2) floor.
			self
				assert: (1 to: split) asSrfi41Stream , (split + 1 to: n) asSrfi41Stream
				equals: (1 to: n)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testAt [
	(1 to: 10) in: [ :interval | 
		| aStream |
		aStream := interval asSrfi41Stream.
		interval do: [ :each | self assert: (aStream at: each) equals: each ].
		self should: [ aStream at: -1 ] raise: SubscriptOutOfBounds.
		self
			should: [ aStream at: interval size + 1 ]
			raise: SubscriptOutOfBounds ]
]

{ #category : #tests }
Srfi41StreamTest >> testCdrs [
	10
		in: [ :n | 
			self
				assert: ((1 to: n) asSrfi41Stream cdrs collect: #asArray)
				equals:
					(OrderedCollection new
						add: #(1 2 3 4 5 6 7 8 9 10);
						add: #(2 3 4 5 6 7 8 9 10);
						add: #(3 4 5 6 7 8 9 10);
						add: #(4 5 6 7 8 9 10);
						add: #(5 6 7 8 9 10);
						add: #(6 7 8 9 10);
						add: #(7 8 9 10);
						add: #(8 9 10);
						add: #(9 10);
						add: #(10);
						add: #();
						yourself)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testChoose [
	| ones |
	4
		in: [ :n | 
			ones := (1 to: n) asSrfi41Stream.
			self
				assert: ((ones choose: 2) collect: #asArray)
				equals:
					(OrderedCollection new
						add: #(1 2);
						add: #(1 3);
						add: #(1 4);
						add: #(2 3);
						add: #(2 4);
						add: #(3 4);
						asArray)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testCollect [
	(1 to: 10)
		in: [ :interval | 
			self
				assert: (interval asSrfi41Stream collect: #squared)
				equals: (interval collect: #squared)
				modulo: #asOrderedCollection.
			self
				assert: ((1 srfi41CountForward collect: #squared) next: interval size)
				equals:(interval collect: #squared)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testCombinations [
	| ones |
	4
		in: [ :n | 
			ones := (1 to: n) asSrfi41Stream.
			self
				assert: (ones combinations collect: #asArray)
				equals:
					(OrderedCollection new
						add: #(1 2 3 4);
						add: #(1 2 3);
						add: #(1 2 4);
						add: #(1 2);
						add: #(1 3 4);
						add: #(1 3);
						add: #(1 4);
						add: #(1);
						add: #(2 3 4);
						add: #(2 3);
						add: #(2 4);
						add: #(2);
						add: #(3 4);
						add: #(3);
						add: #(4);
						add: #();
						asArray)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testConcat [
	30
		in: [ :n | 
			| streamOfStreams |
			streamOfStreams := ((OrderedCollection
				with: (1 to: n / 3)
				with: (n / 3 + 1 to: 2 / 3 * n)
				with: (2 / 3 * n + 1 to: n)) collect: #asSrfi41Stream)
				asSrfi41Stream.
			self
				assert: streamOfStreams concat
				equals: (1 to: n)
				modulo: #asOrderedCollection.
		
			 ]
]

{ #category : #tests }
Srfi41StreamTest >> testConversionToEagerCollection [
	
	"10 is just a number; pick another number, any number..."
(	Array with: {} with: (1 to: 10))
		do: [ :range | 
			self
				assert: range asSrfi41Stream
				equals: range
				modulo: #asOrderedCollection.
			self assert: range asSrfi41Stream equals: range modulo: #asArray ]
]

{ #category : #tests }
Srfi41StreamTest >> testConvolution [
	30
		in: [ :n | 
			self
				assert:
					((1 srfi41Repeat
						convolution: 1 srfi41Repeat
						f: #*
						combiner: [ :a :b | a zip: b with: #+ ]) next: n)
				equals: (1 to: n)
				modulo: #asOrderedCollection.
			self
				assert:
					(( 1  srfi41Repeat
						convolution: #(1 -1) asSrfi41Stream ,  0  srfi41Repeat
						f: #*
						combiner: [ :a :b | a zip: b with: #+ ]) next: n)
				equals: #(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testCorrelation [
	30
		in: [ :n | 
			| streamOfStreams |
			streamOfStreams := #(1 0 1 0 1) asSrfi41Stream
				autoCorrelationWithSimilarity: #=.
			self
				assert: (streamOfStreams collect: #asOrderedCollection)
				equals:
					(OrderedCollection new
						add: #(true true true true true);
						add: #(false false false false);
						add: #(true true true);
						add: #(false false);
						add: #(true);
						collect: #asOrderedCollection)
				modulo: #asOrderedCollection.
			self
				assert: (streamOfStreams collect: #and) asArray
				equals: #(true false true false true) ]
]

{ #category : #tests }
Srfi41StreamTest >> testCrossProduct [
	self
		assert: {} asSrfi41Stream crossProduct
		equals: {}
		modulo: #asOrderedCollection.
	self
		assert: {(1 srfi41CountForward next: 10)} asSrfi41Stream crossProduct
		equals: ((1 to: 10) collect: [ :each | {each} ])
		modulo: #asOrderedCollection.
	self
		assert:
			(OrderedCollection new
				add: (1 to: 10) asSrfi41Stream;
				add: (11 to: 20) asSrfi41Stream;
				add: (21 to: 30) asSrfi41Stream;
				asSrfi41Stream) crossProduct
		equals: #(#(1 11 21)
#(1 11 22)
#(1 11 23)
#(1 11 24)
#(1 11 25)
#(1 11 26)
#(1 11 27)
#(1 11 28)
#(1 11 29)
#(1 11 30)
#(1 12 21)
#(1 12 22)
#(1 12 23)
#(1 12 24)
#(1 12 25)
#(1 12 26)
#(1 12 27)
#(1 12 28)
#(1 12 29)
#(1 12 30)
#(1 13 21)
#(1 13 22)
#(1 13 23)
#(1 13 24)
#(1 13 25)
#(1 13 26)
#(1 13 27)
#(1 13 28)
#(1 13 29)
#(1 13 30)
#(1 14 21)
#(1 14 22)
#(1 14 23)
#(1 14 24)
#(1 14 25)
#(1 14 26)
#(1 14 27)
#(1 14 28)
#(1 14 29)
#(1 14 30)
#(1 15 21)
#(1 15 22)
#(1 15 23)
#(1 15 24)
#(1 15 25)
#(1 15 26)
#(1 15 27)
#(1 15 28)
#(1 15 29)
#(1 15 30)
#(1 16 21)
#(1 16 22)
#(1 16 23)
#(1 16 24)
#(1 16 25)
#(1 16 26)
#(1 16 27)
#(1 16 28)
#(1 16 29)
#(1 16 30)
#(1 17 21)
#(1 17 22)
#(1 17 23)
#(1 17 24)
#(1 17 25)
#(1 17 26)
#(1 17 27)
#(1 17 28)
#(1 17 29)
#(1 17 30)
#(1 18 21)
#(1 18 22)
#(1 18 23)
#(1 18 24)
#(1 18 25)
#(1 18 26)
#(1 18 27)
#(1 18 28)
#(1 18 29)
#(1 18 30)
#(1 19 21)
#(1 19 22)
#(1 19 23)
#(1 19 24)
#(1 19 25)
#(1 19 26)
#(1 19 27)
#(1 19 28)
#(1 19 29)
#(1 19 30)
#(1 20 21)
#(1 20 22)
#(1 20 23)
#(1 20 24)
#(1 20 25)
#(1 20 26)
#(1 20 27)
#(1 20 28)
#(1 20 29)
#(1 20 30)
#(2 11 21)
#(2 11 22)
#(2 11 23)
#(2 11 24)
#(2 11 25)
#(2 11 26)
#(2 11 27)
#(2 11 28)
#(2 11 29)
#(2 11 30)
#(2 12 21)
#(2 12 22)
#(2 12 23)
#(2 12 24)
#(2 12 25)
#(2 12 26)
#(2 12 27)
#(2 12 28)
#(2 12 29)
#(2 12 30)
#(2 13 21)
#(2 13 22)
#(2 13 23)
#(2 13 24)
#(2 13 25)
#(2 13 26)
#(2 13 27)
#(2 13 28)
#(2 13 29)
#(2 13 30)
#(2 14 21)
#(2 14 22)
#(2 14 23)
#(2 14 24)
#(2 14 25)
#(2 14 26)
#(2 14 27)
#(2 14 28)
#(2 14 29)
#(2 14 30)
#(2 15 21)
#(2 15 22)
#(2 15 23)
#(2 15 24)
#(2 15 25)
#(2 15 26)
#(2 15 27)
#(2 15 28)
#(2 15 29)
#(2 15 30)
#(2 16 21)
#(2 16 22)
#(2 16 23)
#(2 16 24)
#(2 16 25)
#(2 16 26)
#(2 16 27)
#(2 16 28)
#(2 16 29)
#(2 16 30)
#(2 17 21)
#(2 17 22)
#(2 17 23)
#(2 17 24)
#(2 17 25)
#(2 17 26)
#(2 17 27)
#(2 17 28)
#(2 17 29)
#(2 17 30)
#(2 18 21)
#(2 18 22)
#(2 18 23)
#(2 18 24)
#(2 18 25)
#(2 18 26)
#(2 18 27)
#(2 18 28)
#(2 18 29)
#(2 18 30)
#(2 19 21)
#(2 19 22)
#(2 19 23)
#(2 19 24)
#(2 19 25)
#(2 19 26)
#(2 19 27)
#(2 19 28)
#(2 19 29)
#(2 19 30)
#(2 20 21)
#(2 20 22)
#(2 20 23)
#(2 20 24)
#(2 20 25)
#(2 20 26)
#(2 20 27)
#(2 20 28)
#(2 20 29)
#(2 20 30)
#(3 11 21)
#(3 11 22)
#(3 11 23)
#(3 11 24)
#(3 11 25)
#(3 11 26)
#(3 11 27)
#(3 11 28)
#(3 11 29)
#(3 11 30)
#(3 12 21)
#(3 12 22)
#(3 12 23)
#(3 12 24)
#(3 12 25)
#(3 12 26)
#(3 12 27)
#(3 12 28)
#(3 12 29)
#(3 12 30)
#(3 13 21)
#(3 13 22)
#(3 13 23)
#(3 13 24)
#(3 13 25)
#(3 13 26)
#(3 13 27)
#(3 13 28)
#(3 13 29)
#(3 13 30)
#(3 14 21)
#(3 14 22)
#(3 14 23)
#(3 14 24)
#(3 14 25)
#(3 14 26)
#(3 14 27)
#(3 14 28)
#(3 14 29)
#(3 14 30)
#(3 15 21)
#(3 15 22)
#(3 15 23)
#(3 15 24)
#(3 15 25)
#(3 15 26)
#(3 15 27)
#(3 15 28)
#(3 15 29)
#(3 15 30)
#(3 16 21)
#(3 16 22)
#(3 16 23)
#(3 16 24)
#(3 16 25)
#(3 16 26)
#(3 16 27)
#(3 16 28)
#(3 16 29)
#(3 16 30)
#(3 17 21)
#(3 17 22)
#(3 17 23)
#(3 17 24)
#(3 17 25)
#(3 17 26)
#(3 17 27)
#(3 17 28)
#(3 17 29)
#(3 17 30)
#(3 18 21)
#(3 18 22)
#(3 18 23)
#(3 18 24)
#(3 18 25)
#(3 18 26)
#(3 18 27)
#(3 18 28)
#(3 18 29)
#(3 18 30)
#(3 19 21)
#(3 19 22)
#(3 19 23)
#(3 19 24)
#(3 19 25)
#(3 19 26)
#(3 19 27)
#(3 19 28)
#(3 19 29)
#(3 19 30)
#(3 20 21)
#(3 20 22)
#(3 20 23)
#(3 20 24)
#(3 20 25)
#(3 20 26)
#(3 20 27)
#(3 20 28)
#(3 20 29)
#(3 20 30)
#(4 11 21)
#(4 11 22)
#(4 11 23)
#(4 11 24)
#(4 11 25)
#(4 11 26)
#(4 11 27)
#(4 11 28)
#(4 11 29)
#(4 11 30)
#(4 12 21)
#(4 12 22)
#(4 12 23)
#(4 12 24)
#(4 12 25)
#(4 12 26)
#(4 12 27)
#(4 12 28)
#(4 12 29)
#(4 12 30)
#(4 13 21)
#(4 13 22)
#(4 13 23)
#(4 13 24)
#(4 13 25)
#(4 13 26)
#(4 13 27)
#(4 13 28)
#(4 13 29)
#(4 13 30)
#(4 14 21)
#(4 14 22)
#(4 14 23)
#(4 14 24)
#(4 14 25)
#(4 14 26)
#(4 14 27)
#(4 14 28)
#(4 14 29)
#(4 14 30)
#(4 15 21)
#(4 15 22)
#(4 15 23)
#(4 15 24)
#(4 15 25)
#(4 15 26)
#(4 15 27)
#(4 15 28)
#(4 15 29)
#(4 15 30)
#(4 16 21)
#(4 16 22)
#(4 16 23)
#(4 16 24)
#(4 16 25)
#(4 16 26)
#(4 16 27)
#(4 16 28)
#(4 16 29)
#(4 16 30)
#(4 17 21)
#(4 17 22)
#(4 17 23)
#(4 17 24)
#(4 17 25)
#(4 17 26)
#(4 17 27)
#(4 17 28)
#(4 17 29)
#(4 17 30)
#(4 18 21)
#(4 18 22)
#(4 18 23)
#(4 18 24)
#(4 18 25)
#(4 18 26)
#(4 18 27)
#(4 18 28)
#(4 18 29)
#(4 18 30)
#(4 19 21)
#(4 19 22)
#(4 19 23)
#(4 19 24)
#(4 19 25)
#(4 19 26)
#(4 19 27)
#(4 19 28)
#(4 19 29)
#(4 19 30)
#(4 20 21)
#(4 20 22)
#(4 20 23)
#(4 20 24)
#(4 20 25)
#(4 20 26)
#(4 20 27)
#(4 20 28)
#(4 20 29)
#(4 20 30)
#(5 11 21)
#(5 11 22)
#(5 11 23)
#(5 11 24)
#(5 11 25)
#(5 11 26)
#(5 11 27)
#(5 11 28)
#(5 11 29)
#(5 11 30)
#(5 12 21)
#(5 12 22)
#(5 12 23)
#(5 12 24)
#(5 12 25)
#(5 12 26)
#(5 12 27)
#(5 12 28)
#(5 12 29)
#(5 12 30)
#(5 13 21)
#(5 13 22)
#(5 13 23)
#(5 13 24)
#(5 13 25)
#(5 13 26)
#(5 13 27)
#(5 13 28)
#(5 13 29)
#(5 13 30)
#(5 14 21)
#(5 14 22)
#(5 14 23)
#(5 14 24)
#(5 14 25)
#(5 14 26)
#(5 14 27)
#(5 14 28)
#(5 14 29)
#(5 14 30)
#(5 15 21)
#(5 15 22)
#(5 15 23)
#(5 15 24)
#(5 15 25)
#(5 15 26)
#(5 15 27)
#(5 15 28)
#(5 15 29)
#(5 15 30)
#(5 16 21)
#(5 16 22)
#(5 16 23)
#(5 16 24)
#(5 16 25)
#(5 16 26)
#(5 16 27)
#(5 16 28)
#(5 16 29)
#(5 16 30)
#(5 17 21)
#(5 17 22)
#(5 17 23)
#(5 17 24)
#(5 17 25)
#(5 17 26)
#(5 17 27)
#(5 17 28)
#(5 17 29)
#(5 17 30)
#(5 18 21)
#(5 18 22)
#(5 18 23)
#(5 18 24)
#(5 18 25)
#(5 18 26)
#(5 18 27)
#(5 18 28)
#(5 18 29)
#(5 18 30)
#(5 19 21)
#(5 19 22)
#(5 19 23)
#(5 19 24)
#(5 19 25)
#(5 19 26)
#(5 19 27)
#(5 19 28)
#(5 19 29)
#(5 19 30)
#(5 20 21)
#(5 20 22)
#(5 20 23)
#(5 20 24)
#(5 20 25)
#(5 20 26)
#(5 20 27)
#(5 20 28)
#(5 20 29)
#(5 20 30)
#(6 11 21)
#(6 11 22)
#(6 11 23)
#(6 11 24)
#(6 11 25)
#(6 11 26)
#(6 11 27)
#(6 11 28)
#(6 11 29)
#(6 11 30)
#(6 12 21)
#(6 12 22)
#(6 12 23)
#(6 12 24)
#(6 12 25)
#(6 12 26)
#(6 12 27)
#(6 12 28)
#(6 12 29)
#(6 12 30)
#(6 13 21)
#(6 13 22)
#(6 13 23)
#(6 13 24)
#(6 13 25)
#(6 13 26)
#(6 13 27)
#(6 13 28)
#(6 13 29)
#(6 13 30)
#(6 14 21)
#(6 14 22)
#(6 14 23)
#(6 14 24)
#(6 14 25)
#(6 14 26)
#(6 14 27)
#(6 14 28)
#(6 14 29)
#(6 14 30)
#(6 15 21)
#(6 15 22)
#(6 15 23)
#(6 15 24)
#(6 15 25)
#(6 15 26)
#(6 15 27)
#(6 15 28)
#(6 15 29)
#(6 15 30)
#(6 16 21)
#(6 16 22)
#(6 16 23)
#(6 16 24)
#(6 16 25)
#(6 16 26)
#(6 16 27)
#(6 16 28)
#(6 16 29)
#(6 16 30)
#(6 17 21)
#(6 17 22)
#(6 17 23)
#(6 17 24)
#(6 17 25)
#(6 17 26)
#(6 17 27)
#(6 17 28)
#(6 17 29)
#(6 17 30)
#(6 18 21)
#(6 18 22)
#(6 18 23)
#(6 18 24)
#(6 18 25)
#(6 18 26)
#(6 18 27)
#(6 18 28)
#(6 18 29)
#(6 18 30)
#(6 19 21)
#(6 19 22)
#(6 19 23)
#(6 19 24)
#(6 19 25)
#(6 19 26)
#(6 19 27)
#(6 19 28)
#(6 19 29)
#(6 19 30)
#(6 20 21)
#(6 20 22)
#(6 20 23)
#(6 20 24)
#(6 20 25)
#(6 20 26)
#(6 20 27)
#(6 20 28)
#(6 20 29)
#(6 20 30)
#(7 11 21)
#(7 11 22)
#(7 11 23)
#(7 11 24)
#(7 11 25)
#(7 11 26)
#(7 11 27)
#(7 11 28)
#(7 11 29)
#(7 11 30)
#(7 12 21)
#(7 12 22)
#(7 12 23)
#(7 12 24)
#(7 12 25)
#(7 12 26)
#(7 12 27)
#(7 12 28)
#(7 12 29)
#(7 12 30)
#(7 13 21)
#(7 13 22)
#(7 13 23)
#(7 13 24)
#(7 13 25)
#(7 13 26)
#(7 13 27)
#(7 13 28)
#(7 13 29)
#(7 13 30)
#(7 14 21)
#(7 14 22)
#(7 14 23)
#(7 14 24)
#(7 14 25)
#(7 14 26)
#(7 14 27)
#(7 14 28)
#(7 14 29)
#(7 14 30)
#(7 15 21)
#(7 15 22)
#(7 15 23)
#(7 15 24)
#(7 15 25)
#(7 15 26)
#(7 15 27)
#(7 15 28)
#(7 15 29)
#(7 15 30)
#(7 16 21)
#(7 16 22)
#(7 16 23)
#(7 16 24)
#(7 16 25)
#(7 16 26)
#(7 16 27)
#(7 16 28)
#(7 16 29)
#(7 16 30)
#(7 17 21)
#(7 17 22)
#(7 17 23)
#(7 17 24)
#(7 17 25)
#(7 17 26)
#(7 17 27)
#(7 17 28)
#(7 17 29)
#(7 17 30)
#(7 18 21)
#(7 18 22)
#(7 18 23)
#(7 18 24)
#(7 18 25)
#(7 18 26)
#(7 18 27)
#(7 18 28)
#(7 18 29)
#(7 18 30)
#(7 19 21)
#(7 19 22)
#(7 19 23)
#(7 19 24)
#(7 19 25)
#(7 19 26)
#(7 19 27)
#(7 19 28)
#(7 19 29)
#(7 19 30)
#(7 20 21)
#(7 20 22)
#(7 20 23)
#(7 20 24)
#(7 20 25)
#(7 20 26)
#(7 20 27)
#(7 20 28)
#(7 20 29)
#(7 20 30)
#(8 11 21)
#(8 11 22)
#(8 11 23)
#(8 11 24)
#(8 11 25)
#(8 11 26)
#(8 11 27)
#(8 11 28)
#(8 11 29)
#(8 11 30)
#(8 12 21)
#(8 12 22)
#(8 12 23)
#(8 12 24)
#(8 12 25)
#(8 12 26)
#(8 12 27)
#(8 12 28)
#(8 12 29)
#(8 12 30)
#(8 13 21)
#(8 13 22)
#(8 13 23)
#(8 13 24)
#(8 13 25)
#(8 13 26)
#(8 13 27)
#(8 13 28)
#(8 13 29)
#(8 13 30)
#(8 14 21)
#(8 14 22)
#(8 14 23)
#(8 14 24)
#(8 14 25)
#(8 14 26)
#(8 14 27)
#(8 14 28)
#(8 14 29)
#(8 14 30)
#(8 15 21)
#(8 15 22)
#(8 15 23)
#(8 15 24)
#(8 15 25)
#(8 15 26)
#(8 15 27)
#(8 15 28)
#(8 15 29)
#(8 15 30)
#(8 16 21)
#(8 16 22)
#(8 16 23)
#(8 16 24)
#(8 16 25)
#(8 16 26)
#(8 16 27)
#(8 16 28)
#(8 16 29)
#(8 16 30)
#(8 17 21)
#(8 17 22)
#(8 17 23)
#(8 17 24)
#(8 17 25)
#(8 17 26)
#(8 17 27)
#(8 17 28)
#(8 17 29)
#(8 17 30)
#(8 18 21)
#(8 18 22)
#(8 18 23)
#(8 18 24)
#(8 18 25)
#(8 18 26)
#(8 18 27)
#(8 18 28)
#(8 18 29)
#(8 18 30)
#(8 19 21)
#(8 19 22)
#(8 19 23)
#(8 19 24)
#(8 19 25)
#(8 19 26)
#(8 19 27)
#(8 19 28)
#(8 19 29)
#(8 19 30)
#(8 20 21)
#(8 20 22)
#(8 20 23)
#(8 20 24)
#(8 20 25)
#(8 20 26)
#(8 20 27)
#(8 20 28)
#(8 20 29)
#(8 20 30)
#(9 11 21)
#(9 11 22)
#(9 11 23)
#(9 11 24)
#(9 11 25)
#(9 11 26)
#(9 11 27)
#(9 11 28)
#(9 11 29)
#(9 11 30)
#(9 12 21)
#(9 12 22)
#(9 12 23)
#(9 12 24)
#(9 12 25)
#(9 12 26)
#(9 12 27)
#(9 12 28)
#(9 12 29)
#(9 12 30)
#(9 13 21)
#(9 13 22)
#(9 13 23)
#(9 13 24)
#(9 13 25)
#(9 13 26)
#(9 13 27)
#(9 13 28)
#(9 13 29)
#(9 13 30)
#(9 14 21)
#(9 14 22)
#(9 14 23)
#(9 14 24)
#(9 14 25)
#(9 14 26)
#(9 14 27)
#(9 14 28)
#(9 14 29)
#(9 14 30)
#(9 15 21)
#(9 15 22)
#(9 15 23)
#(9 15 24)
#(9 15 25)
#(9 15 26)
#(9 15 27)
#(9 15 28)
#(9 15 29)
#(9 15 30)
#(9 16 21)
#(9 16 22)
#(9 16 23)
#(9 16 24)
#(9 16 25)
#(9 16 26)
#(9 16 27)
#(9 16 28)
#(9 16 29)
#(9 16 30)
#(9 17 21)
#(9 17 22)
#(9 17 23)
#(9 17 24)
#(9 17 25)
#(9 17 26)
#(9 17 27)
#(9 17 28)
#(9 17 29)
#(9 17 30)
#(9 18 21)
#(9 18 22)
#(9 18 23)
#(9 18 24)
#(9 18 25)
#(9 18 26)
#(9 18 27)
#(9 18 28)
#(9 18 29)
#(9 18 30)
#(9 19 21)
#(9 19 22)
#(9 19 23)
#(9 19 24)
#(9 19 25)
#(9 19 26)
#(9 19 27)
#(9 19 28)
#(9 19 29)
#(9 19 30)
#(9 20 21)
#(9 20 22)
#(9 20 23)
#(9 20 24)
#(9 20 25)
#(9 20 26)
#(9 20 27)
#(9 20 28)
#(9 20 29)
#(9 20 30)
#(10 11 21)
#(10 11 22)
#(10 11 23)
#(10 11 24)
#(10 11 25)
#(10 11 26)
#(10 11 27)
#(10 11 28)
#(10 11 29)
#(10 11 30)
#(10 12 21)
#(10 12 22)
#(10 12 23)
#(10 12 24)
#(10 12 25)
#(10 12 26)
#(10 12 27)
#(10 12 28)
#(10 12 29)
#(10 12 30)
#(10 13 21)
#(10 13 22)
#(10 13 23)
#(10 13 24)
#(10 13 25)
#(10 13 26)
#(10 13 27)
#(10 13 28)
#(10 13 29)
#(10 13 30)
#(10 14 21)
#(10 14 22)
#(10 14 23)
#(10 14 24)
#(10 14 25)
#(10 14 26)
#(10 14 27)
#(10 14 28)
#(10 14 29)
#(10 14 30)
#(10 15 21)
#(10 15 22)
#(10 15 23)
#(10 15 24)
#(10 15 25)
#(10 15 26)
#(10 15 27)
#(10 15 28)
#(10 15 29)
#(10 15 30)
#(10 16 21)
#(10 16 22)
#(10 16 23)
#(10 16 24)
#(10 16 25)
#(10 16 26)
#(10 16 27)
#(10 16 28)
#(10 16 29)
#(10 16 30)
#(10 17 21)
#(10 17 22)
#(10 17 23)
#(10 17 24)
#(10 17 25)
#(10 17 26)
#(10 17 27)
#(10 17 28)
#(10 17 29)
#(10 17 30)
#(10 18 21)
#(10 18 22)
#(10 18 23)
#(10 18 24)
#(10 18 25)
#(10 18 26)
#(10 18 27)
#(10 18 28)
#(10 18 29)
#(10 18 30)
#(10 19 21)
#(10 19 22)
#(10 19 23)
#(10 19 24)
#(10 19 25)
#(10 19 26)
#(10 19 27)
#(10 19 28)
#(10 19 29)
#(10 19 30)
#(10 20 21)
#(10 20 22)
#(10 20 23)
#(10 20 24)
#(10 20 25)
#(10 20 26)
#(10 20 27)
#(10 20 28)
#(10 20 29)
#(10 20 30))
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41StreamTest >> testDovetail [
	| ones twos threes streams |
	ones := 1 srfi41Repeat.
	twos := 2 srfi41Repeat.
	threes := 3 srfi41Repeat.
	streams := {ones.
	twos.
	threes} asSrfi41Stream.
	"		self
		assert: ones srfi41Singleton dovetailClockwise
		equals: (ones collect: #srfi41Singleton)
		modulo: #asOrderedCollection."
	self
		assert: (streams dovetailClockwise concat next: 30)
		equals: #(1 1 2 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3)
		modulo: #asOrderedCollection.
	self
		assert: (streams dovetailCounterClockwise concat next: 30)
		equals: #(1 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1 3 2 1)
		modulo: #asOrderedCollection.
	self
		assert:
			([ :i | {} asSrfi41Stream ] >>= (1 srfi41CountForward next: 1))
				isEmpty
]

{ #category : #tests }
Srfi41StreamTest >> testEmptyStream [
	| emptyStream |
	emptyStream := {} asSrfi41Stream.
	self assert: emptyStream isEmpty.
	self assert: [ {} asSrfi41Stream ] srfi41Stream isEmpty.
	self
		should: [ [ {} ] srfi41Stream isEmpty ]
		raise: MessageNotUnderstood.
	"self deny: [ {} asSrfi41Stream ] srfi41Delay isEmpty."
	^ emptyStream
]

{ #category : #tests }
Srfi41StreamTest >> testFlatCollect [
	(1 to: 10)
		in: [ :interval | 
			self
				assert:
					(interval asSrfi41Stream
						flatCollect: [ :each | (1 to: each) asSrfi41Stream collect: #reciprocal ])
				equals:
					(interval flatCollect: [ :each | (1 to: each) collect: #reciprocal ])
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testFoldr [
	20
		in: [ :n | 
			self
				assert: ((1 srfi41CountForward next: n) foldrStrict: #+ init: [ 0 ])
				equals: 210 ]
]

{ #category : #tests }
Srfi41StreamTest >> testFundamentalCheck [
	"Even streams are more complex than odd streams in both definition and usage, but they offer a strong benefit: they fix the off-by-one error of odd streams. Wadler, Taha and MacQueen show, for instance, that an expression like (stream->list 4 (stream-map / (stream-from 4 -1))) evaluates to (1/4 1/3 1/2 1) using even streams but fails with a divide-by-zero error using odd streams, because the next element in the stream, which will be 1/0, is evaluated before it is accessed. This extra bit of laziness is not just an interesting oddity; it is vitally critical in many circumstances, as will become apparent below."

	self
		assert:
			(((4 to: -10 by: -1) asSrfi41Stream collect: #reciprocal )
				next: 4)
		equals:
			{(1 / 4).
			(1 / 3).
			(1 / 2).
			1}
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41StreamTest >> testInits [
	10
		in: [ :n | 
			self
				assert: ((1 to: n) asSrfi41Stream inits collect: #asArray)
				equals:
					(OrderedCollection new
						add: #();
						add: #(1);
						add: #(1 2);
						add: #(1 2 3);
						add: #(1 2 3 4);
						add: #(1 2 3 4 5);
						add: #(1 2 3 4 5 6);
						add: #(1 2 3 4 5 6 7);
						add: #(1 2 3 4 5 6 7 8);
						add: #(1 2 3 4 5 6 7 8 9);
						add: #(1 2 3 4 5 6 7 8 9 10);
						yourself)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testIntersperse [
	| ones |
	ones :=  1  srfi41Repeat.
	self
		assert:
			(((ones intersperse: 2) next: 10)
				collect: [ :s | (s next: 10) asArray ])
		equals:
			(OrderedCollection new
				add: #(2 1 1 1 1 1 1 1 1 1);
				add: #(1 2 1 1 1 1 1 1 1 1);
				add: #(1 1 2 1 1 1 1 1 1 1);
				add: #(1 1 1 2 1 1 1 1 1 1);
				add: #(1 1 1 1 2 1 1 1 1 1);
				add: #(1 1 1 1 1 2 1 1 1 1);
				add: #(1 1 1 1 1 1 2 1 1 1);
				add: #(1 1 1 1 1 1 1 2 1 1);
				add: #(1 1 1 1 1 1 1 1 2 1);
				add: #(1 1 1 1 1 1 1 1 1 2);
				asArray)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41StreamTest >> testLayers [
	| ones twos threes streams fours fives |
	ones :=  1  srfi41Repeat.
	twos :=  2  srfi41Repeat.
	threes :=  3  srfi41Repeat.
	fours :=  4  srfi41Repeat.
	fives :=  5  srfi41Repeat.
	streams := OrderedCollection new
		add: ones;
		add: twos;
		add: threes;
		add: fours;
		add: fives;
		asSrfi41Stream.
	self
		assert: (streams layers concat next: 30)
		equals: #(1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41StreamTest >> testMerge [
	30 in: [ :n | 
		self
			assert: (((OrderedCollection new
					   add: 2 srfi41Repeat;
					   add: 1 srfi41Repeat;
					   add: 3 srfi41Repeat;
					   asSrfi41Stream) mergeWithSortBlock: #<) next: n)
			equals: ((1 to: n) collect: [ :_ | 1 ])
			modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testMonadBind [
	self assert: ([ :i | i srfi41Repeat ] >>= {} asSrfi41Stream) isEmpty.
	30
		in: [ :n | 
			self
				assert: ([ :i | i srfi41CountBackward ] >>= 1 srfi41CountForward next: n)
				equals:
					#(1 2 0 3 1 -1 4 2 0 -2 5 3 1 -1 -3 6 4 2 0 -2 -4 7 5 3 1 -1 -3 -5 8 6)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testNextEvery [
	20
		in: [ :n | 
			self
				assert: ((0 srfi41CountForward nextEvery: 2) next: n)
				equals: (0 to: 2 * (n - 1) by: 2)
				modulo: #asOrderedCollection.
			self
				assert: (((1 to: 10) asSrfi41Stream nextEvery: 3) next: n)
				equals: {1 . 4 . 7 . 10}
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testPeriodic [
	20
		in: [ :n | 
			self
				assert: ({1 . -1} asSrfi41Stream periodic next: n)
				equals:
					{1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1.
					1 . -1 . 1 . -1}
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testPermutations [
	| ones |
	4
		in: [ :n | 
			ones := (1 to: n) asSrfi41Stream.
			self
				assert:
					((ones permutations next: n factorial) collect: [ :s | (s next: 10) asArray ])
				equals:
					(OrderedCollection new
						add: #(1 2 3 4);
						add: #(2 1 3 4);
						add: #(2 3 1 4);
						add: #(2 3 4 1);
						add: #(1 3 2 4);
						add: #(3 1 2 4);
						add: #(3 2 1 4);
						add: #(3 2 4 1);
						add: #(1 3 4 2);
						add: #(3 1 4 2);
						add: #(3 4 1 2);
						add: #(3 4 2 1);
						add: #(1 2 4 3);
						add: #(2 1 4 3);
						add: #(2 4 1 3);
						add: #(2 4 3 1);
						add: #(1 4 2 3);
						add: #(4 1 2 3);
						add: #(4 2 1 3);
						add: #(4 2 3 1);
						add: #(1 4 3 2);
						add: #(4 1 3 2);
						add: #(4 3 1 2);
						add: #(4 3 2 1);
						asArray)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testRepeat [
	30 in: [ :n | 
		self
			assert: (1 srfi41Repeat next: n)
			equals: ((1 to: n) collect: [ :_ | 1 ])
			modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testReverse [
	(1 to: 10)
		in: [ :interval | 
			self
				assert: interval asSrfi41Stream reverse
				equals: interval reverse
				modulo: #asOrderedCollection ].
	(-5 to: 5)
		in: [ :interval | 
			self
				assert: (interval asSrfi41Stream collect: #reciprocal) reverse size
				equals: interval size
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testScan [
	20
		in: [ :n | 
			self
				assert: ((1 srfi41Repeat scan: #+ initBlock: [0]) next: n)
				equals: (0 to: n - 1)
				modulo: #asOrderedCollection ]
]

{ #category : #tests }
Srfi41StreamTest >> testSize [
	self assert: {} asSrfi41Stream size equals: 0.
	self
		assert: ([ 1 / 0 ] srfi41Cons: [ {} asSrfi41Stream ]) size
		equals: 1.	
			
			"10 is just a number; pick another number, any number..."
	(1 to: 10)
		in: [ :range | self assert: range asSrfi41Stream size equals: range size ]
]

{ #category : #tests }
Srfi41StreamTest >> testSort [
	self
		assert: ((100 srfi41Collatz next: 40) sort: #<)
		equals:
			#(1 1 1 1 1 2 2 2 2 2 2 4 4 4 4 4 4 5 8 10 11 13 16 17 19 20 22 25 26 29 34 38 40 44 50 52 58 76 88 100)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41StreamTest >> testZipLongest [
	self
		assert:
			(#(1 2 3) asSrfi41Stream
				zipLongest: #(1 2 3 4 5) asSrfi41Stream
				with: [ :f :s :isSentinel | 
					(isSentinel value: f)
						ifTrue: [ s ]
						ifFalse: [ f + s ] ])
		equals: #(2 4 6 4 5)
		modulo: #asOrderedCollection
]
