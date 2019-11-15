accessing
combinations
	^ [ self
		letCarCdr: [ :car :cdr | 
			| withoutCarStream combinationsWithCar |
			withoutCarStream := cdr select: [ :each | each ~~ car ].
			combinationsWithCar := withoutCarStream combinations
				collect: [ :aStream | [ car ] srfi41ConsSrfi41Stream: aStream ].
			combinationsWithCar , withoutCarStream combinations ]
		ifEmpty: [ {} asSrfi41Stream srfi41Singleton ] ] srfi41Stream