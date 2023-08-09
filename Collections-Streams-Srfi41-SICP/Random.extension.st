Extension { #name : #Random }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
Random >> asSrfi41SICPStream [

	^ Srfi41SICPStream random: self
]
