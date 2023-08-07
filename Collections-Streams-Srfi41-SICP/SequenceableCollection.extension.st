Extension { #name : #SequenceableCollection }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
SequenceableCollection >> asSrfi41SICPStream [

	^ self reversed
		  inject: Srfi41SICPStream empty
		  into: [ :stream :each |
		  Srfi41SICPStream head: each tail: [ stream ] ]
]
