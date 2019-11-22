as yet unclassified
zip: aStream with: aBlock
	^ [ (self isEmpty or: [ aStream isEmpty ])
		ifTrue: [ {} asSrfi41Stream ]
		ifFalse: [ [ aBlock value: self car value: aStream car ]
				srfi41Cons: [ self cdr zip: aStream cdr with: aBlock ] ] ]
		srfi41Stream