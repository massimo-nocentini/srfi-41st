Class {
	#name : #Srfi41SICPEulerTransform,
	#superclass : #Srfi41SICPTransform,
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #accessing }
Srfi41SICPEulerTransform >> headOf: stream [

	| s0 s1 s2 |
	s0 := stream head.
	s1 := stream tail head.
	s2 := stream tail tail head.

	^ s2 - ((s2 - s1) squared / (s0 - s1 double + s2))
]
