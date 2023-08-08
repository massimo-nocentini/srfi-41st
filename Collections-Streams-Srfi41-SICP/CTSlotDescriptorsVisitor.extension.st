Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Collections-Streams-Srfi41-SICP' }
CTSlotDescriptorsVisitor >> visitSrfi41UnitValuableMemoizer: memoizer [

	^ {
		  (self newSlotDescriptorSelector: #hasBeenEvaluated).
		  (self newSlotDescriptorSelector: #value) }
]
