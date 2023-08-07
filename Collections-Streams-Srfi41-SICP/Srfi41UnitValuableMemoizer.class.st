Class {
	#name : #Srfi41UnitValuableMemoizer,
	#superclass : #Object,
	#instVars : [
		'valuable',
		'hasBeenEvaluated',
		'value',
		'evaluating'
	],
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #evaluating }
Srfi41UnitValuableMemoizer >> evaluating: block for: client [

	| ret |
	evaluating ifTrue: [
		Error signal:
			'Endless recursion: try to evaluate during evaluation.' ].

	evaluating := true.
	ret := block value: client.
	evaluating := false.

	^ ret
]

{ #category : #initialization }
Srfi41UnitValuableMemoizer >> initialize [

	super initialize.

	hasBeenEvaluated := false.
	evaluating := false
]

{ #category : #accessing }
Srfi41UnitValuableMemoizer >> valuable: anObject [

	valuable := anObject
]

{ #category : #evaluating }
Srfi41UnitValuableMemoizer >> value [

	^ self valueFor: nil
]

{ #category : #evaluating }
Srfi41UnitValuableMemoizer >> valueFor: client [

	hasBeenEvaluated ifFalse: [
		value := self evaluating: valuable for: client.

		hasBeenEvaluated := true ].

	^ value
]
