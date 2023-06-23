Extension { #name : #SequenceableCollection }

{ #category : #'*Collections-Streams-Srfi41' }
SequenceableCollection >> asSrfi41Stream [
	^ [ self
		ifEmpty: [ Srfi41Stream empty ]
		ifNotEmpty: [ [ self first ] srfi41Cons: [ self allButFirst asSrfi41Stream ] ] ]
		srfi41Stream
]
