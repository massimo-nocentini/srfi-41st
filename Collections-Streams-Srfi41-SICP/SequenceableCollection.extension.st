Extension { #name : #SequenceableCollection }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
SequenceableCollection >> asSrfi41SICPStream [

	^ self asSrfi41SICPStreamFromIndex: 1
]

{ #category : #'*Collections-Streams-Srfi41-SICP' }
SequenceableCollection >> asSrfi41SICPStreamFromIndex: i [

	^ i <= self size
		  ifTrue: [
			  Srfi41SICPStream
				  head: (self at: i)
				  tail: [ self asSrfi41SICPStreamFromIndex: i + 1 ] ]
		  ifFalse: [ Srfi41SICPStream empty ]
]
