as yet unclassified
zip: aStream with: aBlock
	^ [ (self isEmptyStream or: [ aStream isEmptyStream ])
		ifTrue: [ {} asSrfi41Stream ]
		ifFalse: [ [ aBlock value: self car value: aStream car ]
				srfi41Cons: [ self cdr zip: aStream cdr with: aBlock ] ] ]
		srfi41Stream