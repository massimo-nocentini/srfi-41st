Extension { #name : #Point }

{ #category : #'*Collections-Streams-Srfi41-Combinatorics' }
Point >> catalanTriangle [
	^ CTArray2D
		width: self y
		height: self x
		tabulate: [ :k :n | n - 1 catalan: k - 1 ]
]

{ #category : #'*Collections-Streams-Srfi41-Combinatorics' }
Point >> pascalTriangle [
	^ CTArray2D
		width: self y
		height: self x
		tabulate: [ :k :n | n - 1 choose: k - 1 ]
]
