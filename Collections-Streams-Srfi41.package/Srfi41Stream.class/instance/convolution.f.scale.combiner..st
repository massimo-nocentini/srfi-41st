as yet unclassified
convolution: aStream f: fBlock scale: sBlock combiner: cBlock
	^ [ (self isEmpty or: [ aStream isEmpty ])
		ifTrue: [ {} asSrfi41Stream ]
		ifFalse: [ [ fBlock value: self car value: aStream car ]
				srfi41Cons: [ cBlock
						value: (aStream cdr collect: [ :o | sBlock value: self car value: o ])
						value:
							(self cdr
								convolution: aStream
								f: fBlock
								scale: sBlock
								combiner: cBlock) ] ] ] srfi41Stream