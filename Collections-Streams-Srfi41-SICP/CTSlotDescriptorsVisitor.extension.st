Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
CTSlotDescriptorsVisitor >> visitSrfi41UnitValuableMemoizer: memoizer [

	^ {
		  (self newSlotDescriptorSelector: #hasBeenEvaluated).
		  (memoizer hasBeenEvaluated
			   ifTrue: [ self newSlotDescriptorSelector: #value ]
			   ifFalse: [ self newSlotDescriptorSelector: #valuable ]) }
]
