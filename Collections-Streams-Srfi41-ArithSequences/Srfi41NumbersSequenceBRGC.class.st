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
