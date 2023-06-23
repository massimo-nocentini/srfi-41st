Class {
	#name : #Srfi41AbstractTest,
	#superclass : #TestCase,
	#category : 'Collections-Streams-Srfi41-Tests'
}

{ #category : #tests }
Srfi41AbstractTest >> assert: actual equals: expected modulo: aSelector [
	"I'm an helper of #assert:equals: that comsume two collections (not strictly eager ones) and
	check if they are the same with respect to conversion given by `aSelector`."

	self
		assert: (aSelector value: actual)
		equals: (aSelector value: expected)
]

{ #category : #tests }
Srfi41AbstractTest >> assert: actual equals: expected upto: n modulo: aSelector [
	"I'm an helper of #assert:equals: that comsume two collections (not strictly eager ones) and
	check if they are the same with respect to conversion given by `aSelector`."

	self
		assert: (aSelector value: (actual stream next: n))
		equals: (aSelector value: (expected stream next: n))
]

{ #category : #tests }
Srfi41AbstractTest >> testAssertEqualsModulo [
	10
		in: [ :n | 
			self
				shouldnt: [ self
						assert: (1 to: n)
						equals: (1 to: n) asOrderedCollection
						modulo: #asArray ]
				raise: TestFailure .
				self
				should: [ self
						assert: (1 to: n+1)
						equals: (1 to: n) asOrderedCollection
						modulo: #asArray ]
				raise: TestFailure ]
]
