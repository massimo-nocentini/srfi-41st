Extension { #name : #Object }

{ #category : #'*Collections-Streams-Srfi41' }
Object >> ifSrfi41Stream: thenBlock ifNotSrfi41Stream: elseBlock [
	^ elseBlock cull: self
]

{ #category : #'*Collections-Streams-Srfi41' }
Object >> srfi41Repeat [
	^ [ self ] srfi41Cons: [ self srfi41Repeat ]
]

{ #category : #'*Collections-Streams-Srfi41' }
Object >> srfi41Singleton [
	^ [ self ] srfi41Cons: [ {} asSrfi41Stream ]
]

{ #category : #'*Collections-Streams-Srfi41' }
Object >> srfi41Stream [
	^ Srfi41Stream object: self
]
