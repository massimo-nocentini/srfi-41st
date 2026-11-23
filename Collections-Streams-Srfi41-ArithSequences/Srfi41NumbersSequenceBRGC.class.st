"
I am the stream of the binary reflected Gray codes. My first element has the empty code only, and the element after n-bit codes has the codes of n + 1 bits: those of n bits prefixed by 0, then the same in reverse order prefixed by 1. Each element is an array of codes, and each code an array of bits.

```smalltalk
(Srfi41NumbersSequence binaryReflectedGrayCodes next: 3) asArray.
""#(#(#()) #(#(0) #(1)) #(#(0 0) #(0 1) #(1 1) #(1 0)))""
```
"
Class {
	#name : #Srfi41NumbersSequenceBRGC,
	#superclass : #Srfi41NumbersSequence,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #evaluating }
Srfi41NumbersSequenceBRGC >> definition [
	| graycode |
	graycode := nil.
	graycode := [ Array new srfi41Singleton ]
		srfi41Cons: [ graycode
				collect: [ :codesStream | 
					(codesStream collect: [ :code | Array with: 0 withAll: code ])
						, (codesStream reverse collect: [ :code | Array with: 1 withAll: code ]) ] ].
	^ graycode
]

{ #category : #evaluating }
Srfi41NumbersSequenceBRGC >> value [
	^ super value collect: #asArray
]
