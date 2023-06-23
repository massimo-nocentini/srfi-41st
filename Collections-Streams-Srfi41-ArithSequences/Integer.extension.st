Extension { #name : #Integer }

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> piWithPrimesSrfi41Stream: primes [
	^ (primes nextWhile: [ :aPrime | aPrime <= self ]) size
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41Collatz [
	^ [ :x | 
	x even
		ifTrue: [ x / 2 ]
		ifFalse: [ 3 * x + 1 ] ] srfi41Iter value: self
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41CountBackward [
	^ self srfi41CountBy: -1
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41CountBy: anInteger [
	^ [ [ self ] srfi41Cons: [self + anInteger srfi41CountBy: anInteger] ]srfi41Stream 
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41CountForward [
	^ self srfi41CountBy: 1
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41ParkMiller [
	^[ ([ :x | 7 ** 5 * x rem: 2 ** 32 ] srfi41Iter value: self) cdr] srfi41Stream 
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41RationalsWithoutDuplicates [
	"(stream-iterate
    (lambda (x)
      (let* ((n (floor x)) (y (- x n)))
        (/ (- n -1 y))))
    1)"

	^ [ [ :x | 
	| n y |
	n := x floor.
	y := x - n.
	(n + 1 - y) reciprocal ] srfi41Iter value: self ] srfi41Stream
]

{ #category : #'*Collections-Streams-Srfi41-ArithSequences' }
Integer >> srfi41UniformContinuedFraction [
	^ [ :x | self + x reciprocal ] srfi41Iter value: 1
]
