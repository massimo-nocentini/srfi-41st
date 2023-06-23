Class {
	#name : #Srfi41NumbersSequence,
	#superclass : #Object,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #operations }
Srfi41NumbersSequence class >> binaryReflectedGrayCodes [
	^ Srfi41NumbersSequenceBRGC  new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> factorials [
	^ Srfi41NumbersSequenceFactorial  new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> fibonacciCorecursive [
	^ Srfi41NumbersSequenceFibonacciCorecursive new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> fluents [
	^ Srfi41NumbersSequenceFluents new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> hamming [
	^ Srfi41NumbersSequenceHamming new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> lucasCorecursive [
	^ Srfi41NumbersSequenceLucasCorecursive new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> naturalsCorecursive [
	^ Srfi41NumbersSequenceNaturalsCorecursive  new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> naturalsIterative [
	^ Srfi41NumbersSequenceNaturalsIterative  new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> nthRootsOfUnity [
	^ Srfi41NumbersSequenceNthRootsOfUnity new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> primesEratosthenes [
	^ Srfi41NumbersSequencePrimesEratosthenes  new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> primesReade [
	^ Srfi41NumbersSequencePrimesReade new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> random [
	^ Srfi41NumbersSequenceRandom new value
]

{ #category : #operations }
Srfi41NumbersSequence class >> triangulars [
	^ Srfi41NumbersSequenceTriangular new value
]

{ #category : #evaluating }
Srfi41NumbersSequence >> definition [
	self subclassResponsibility
]

{ #category : #evaluating }
Srfi41NumbersSequence >> value [
	^ [self definition] srfi41Stream 
]
