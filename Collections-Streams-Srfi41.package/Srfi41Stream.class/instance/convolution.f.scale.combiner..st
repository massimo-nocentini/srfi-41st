as yet unclassified
convolution: aStream f: fBlock scale: sBlock combiner: cBlock
	^ [ self
		letCarCdr: [ :car :cdr | 
			aStream
				letCarCdr: [ :otherCar :otherCdr | 
					[ fBlock value: car value: otherCar ]
						srfi41Cons: [ cBlock
								value: (otherCdr collect: [ :o | sBlock value: car value: o ])
								value: (cdr convolution: aStream f: fBlock scale: sBlock combiner: cBlock) ] ]
				ifEmpty: [ {} asSrfi41Stream ] ]
		ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream