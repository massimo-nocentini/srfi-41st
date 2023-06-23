Class {
	#name : #Srfi41NQueens,
	#superclass : #Object,
	#category : 'Collections-Streams-Srfi41-ArithSequences'
}

{ #category : #'as yet unclassified' }
Srfi41NQueens >> check: aPoint with: anotherPoint [
	|i j m n|
	i := aPoint x.
	j := aPoint y.
	m := anotherPoint x .
	n := anotherPoint y.
	^ j = n or: [ i + j = (m + 1 + n) or: [ i - j = (m + 1 - n) ] ]
]

{ #category : #'as yet unclassified' }
Srfi41NQueens >> isSafe: p at: n [
	| m |
	m := p size.
	^ ((1 to: m) asSrfi41Stream
		zip: p
		with: [ :i :j | 
			(self
				check: i @ j
				with: m @  n) not ]) and
]

{ #category : #'as yet unclassified' }
Srfi41NQueens >> queens: n [
	^  (self queens: n subproblem: n ) collect: #asArray
]

{ #category : #'as yet unclassified' }
Srfi41NQueens >> queens: n subproblem: m [
	^ [ m isZero
		ifTrue: [ {} asSrfi41Stream srfi41Singleton ]
		ifFalse: [ |  |
			 ( OrderedCollection new
				add: (self queens: n subproblem: m - 1);
				add: (1 to: n) asSrfi41Stream;
				asSrfi41Stream)
			 |? [ :p :nn | self isSafe: p at: nn ]
				|> [ :p :nn | p , nn srfi41Singleton ] ] ] srfi41Stream
]
