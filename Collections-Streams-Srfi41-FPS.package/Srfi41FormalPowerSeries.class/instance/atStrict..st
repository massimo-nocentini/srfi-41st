accessing
atStrict: aNumber
	^ self stream
		foldrStrict: [ :each :acc | aNumber * acc + each ]
		init: [ 0 ]