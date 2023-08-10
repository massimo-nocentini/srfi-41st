Extension { #name : #SequenceableCollection }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
SequenceableCollection >> asSrfi41SICPStream [

	^ self
		  ifEmpty: [ Srfi41SICPStream empty ]
		  ifNotEmpty: [ self asSrfi41SICPStreamFromIndex: 1 ]
]

{ #category : #'*Collections-Streams-Srfi41-SICP' }
SequenceableCollection >> asSrfi41SICPStreamFromIndex: i [

	^ i <= self size
		  ifTrue: [
			  | head |
			  head := self at: i.
			  head >~ [ self asSrfi41SICPStreamFromIndex: i + 1 ] ]
		  ifFalse: [ {  } asSrfi41SICPStream ]
]
