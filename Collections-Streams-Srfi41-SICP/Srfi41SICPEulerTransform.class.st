"
I am Euler's transform of a stream of partial sums. From three consecutive elements `s0`, `s1` and `s2`, I compute `s2 - ((s2 - s1) squared / (s0 - s1 double + s2))`.

```smalltalk
| sums |
sums := (Srfi41SICPStream naturals collect: [ :n |
	         (n even ifTrue: [ 4 ] ifFalse: [ -4 ]) / (2 * n + 1) ])
	        partial: [ :a :b | a + b ].
(sums take: 3) asArray.
""{4. (8/3). (52/15)}""
((sums transform: Srfi41SICPEulerTransform new) take: 3) asArray.
""{(19/6). (47/15). (1321/420)}""
```
"
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
