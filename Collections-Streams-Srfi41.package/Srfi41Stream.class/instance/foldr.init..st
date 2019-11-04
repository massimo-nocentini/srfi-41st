accessing
foldr: aBlock init: baseBlock
	^ self
		ifEmpty: baseBlock
		ifNotEmpty: [ aBlock
				value: [ self car ]
				value: [ self cdr foldr: aBlock init: baseBlock ] ]