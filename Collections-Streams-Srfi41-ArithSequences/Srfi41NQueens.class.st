"
I solve the n queens puzzle with streams, as the section _Backtracking via the stream of successes_ of the comment of `Srfi41Stream` does: `queens: n` answers a `Srfi41Stream` of solutions. A solution is an array that gives, for each column, the row of its queen.

```smalltalk
(Srfi41NQueens new queens: 4) asArray.
""#(#(2 4 1 3) #(3 1 4 2))""
```

- `queens: n subproblem: m` answers the ways to place the queens of the first `m` columns, as streams of rows. It extends those of `m - 1` columns, and the backtracking is implicit in the recursive message.
- `isSafe: p at: n` answers whether a queen in row `n` of the next column is not held in check by the queens of `p`.
- `check: aPoint with: anotherPoint` answers whether two queens are in the same row or on the same diagonal. `aPoint` is the column and the row of a queen already placed; `anotherPoint` is the number of the queens placed and the row of the new one.
"
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
