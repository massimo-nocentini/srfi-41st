accessing
foldrStrict: aBlock init: base
	^ self
		foldr:
			[ :eachBlock :accBlock | aBlock value: eachBlock value value: accBlock value ]
		init: base