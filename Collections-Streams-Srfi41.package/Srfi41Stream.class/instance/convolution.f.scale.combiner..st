as yet unclassified
convolution: aStream f: fBlock scale: sBlock combiner: cBlock
	^ [ (self isEmpty or: [ aStream isEmpty ])
		ifTrue: [ {} asSrfi41Stream ]
		ifFalse: [ [ | car |
			car := self car.
			[ fBlock value: car value: aStream car ]
				srfi41Cons: [ | cdr |
					cdr := self cdr
						convolution: aStream
						f: fBlock
						scale: sBlock
						combiner: cBlock.
					cBlock
						value: (aStream cdr collect: [ :o | sBlock value: car value: o ])
						value: cdr ] ] srfi41Stream ] ] srfi41Stream