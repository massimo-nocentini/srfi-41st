Extension { #name : #Object }

{ #category : #'*Collections-Streams-Srfi41-Extensions' }
Object >> I [
]

{ #category : #'*Collections-Streams-Srfi41-Extensions' }
Object >> K [
	^ [ :_ | self ]
]

{ #category : #'*Collections-Streams-Srfi41-Extensions' }
Object >> S: x [
	

	^ [ :y | self S: x s: y ]
]

{ #category : #'*Collections-Streams-Srfi41-Extensions' }
Object >> S: x s: y [
	"x y z = (x z) (y z)"

	| X |
	X := x value: self.
	^ X value: (y value: self)
]
