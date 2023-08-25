Extension { #name : #BlockClosure }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
BlockClosure >> appendedOn_Srfi41SICPStream: prefix [

	^ prefix append_BlockClosure: self
]

{ #category : #'*Collections-Streams-Srfi41-SICP' }
BlockClosure >> asSrfi41SICPStream [

	^ Srfi41SICPSuspensionStream head: nil tail: self
]
