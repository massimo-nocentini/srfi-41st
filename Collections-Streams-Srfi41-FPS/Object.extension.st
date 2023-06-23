Extension { #name : #Object }

{ #category : #'*Collections-Streams-Srfi41-FPS' }
Object >> ifFPS: aBlockClosure ifNotFPS: elseBlockClosure [
	^ elseBlockClosure cull: self
]
