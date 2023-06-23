Class {
	#name : #Srfi41NumbersSequenceRandom,
	#superclass : #Srfi41NumbersSequence,
	#instVars : [
		'random'
	],
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceRandom >> definition [
	^ [ self random next ] srfi41Cons: [ self definition  ]
]

{ #category : #accessing }
Srfi41NumbersSequenceRandom >> initialize [ 
super initialize.

random := Random seed: 7 ** 5
]

{ #category : #accessing }
Srfi41NumbersSequenceRandom >> random [
	^ random
]

{ #category : #accessing }
Srfi41NumbersSequenceRandom >> random: anObject [
	random := anObject
]
