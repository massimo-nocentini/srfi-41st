Extension { #name : #BlockClosure }

{ #category : #'*Collections-Streams-Srfi41-FPS' }
BlockClosure >> srfi41ConsFPS: ontoBlock of: t [
	^ (self srfi41Cons: [ ontoBlock value stream ]) asFPSof: t
]

{ #category : #'*Collections-Streams-Srfi41-FPS' }
BlockClosure >> srfi41StreamFPSof: t [
	^ [ self value stream ] srfi41Stream asFPSof: t
]
