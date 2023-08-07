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
Srfi41UnitValuableMemoizer >> evaluating: block [

	| ret |
	evaluating ifTrue: [
		Error signal:
			'Endless recursion: try to evaluate during evaluation.' ].

	evaluating := true.
	ret := block value.
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

	hasBeenEvaluated ifFalse: [
		value := self evaluating: valuable.

		hasBeenEvaluated := true ].

	^ value
]
