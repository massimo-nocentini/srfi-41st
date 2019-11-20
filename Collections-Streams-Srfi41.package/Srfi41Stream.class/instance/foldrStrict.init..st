accessing
foldrStrict: aBlock init: baseBlock
	^ self
		foldr:
			[ :eachBlock :accBlock | aBlock value: eachBlock value value: accBlock value ]
		init: baseBlock