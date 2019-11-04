accessing
foldrStrict: aBlock init: base
	^ self
		foldr: [ :each :acc | aBlock value: each value value: acc value ]
		init: base value