"
I am the abstract superclass of the sequences of numbers defined as streams. My subclasses implement `definition`, which answers a `Srfi41Stream`, and `value` suspends it: nothing is computed until an element is asked for.

My class side has a message for each sequence, which answers a new stream:

| Message | First elements |
|:--|:--|
| `binaryReflectedGrayCodes` | see `Srfi41NumbersSequenceBRGC` |
| `factorials` | 1 1 2 6 24 120 |
| `fibonacciCorecursive` | 0 1 1 2 3 5 |
| `fluents` | 1, see `Srfi41NumbersSequenceFluents` |
| `hamming` | 1 2 3 4 5 6 8 |
| `lucasCorecursive` | 2 1 3 4 7 11 |
| `naturalsCorecursive` | 0 1 2 3 4 5 |
| `naturalsIterative` | 0 1 2 3 4 5 |
| `nthRootsOfUnity` | see `Srfi41NumbersSequenceNthRootsOfUnity` |
| `primesEratosthenes` | 2 3 5 7 11 13 |
| `primesReade` | 2 3 5 7 11 13 |
| `random` | see `Srfi41NumbersSequenceRandom` |
| `triangulars` | 0 1 3 6 10 15 |

```smalltalk
(Srfi41NumbersSequence factorials next: 8) asArray.
""#(1 1 2 6 24 120 720 5040)""
```
"
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
