Extension { #name : #Point }

{ #category : #'*Collections-Streams-Srfi41-Combinatorics' }
Point >> catalanTriangle [
	^ Array2D
		rows: self x
		columns: self y
		tabulate: [ :n :k | n - 1 catalan: k - 1 ]
]

{ #category : #'*Collections-Streams-Srfi41-Combinatorics' }
Point >> pascalTriangle [
	^ Array2D
		rows: self x
		columns: self y
		tabulate: [ :n :k | n - 1 choose: k - 1 ]
]
