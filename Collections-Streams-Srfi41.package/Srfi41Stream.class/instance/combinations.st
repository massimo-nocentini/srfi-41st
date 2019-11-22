accessing
combinations
	^ [ self
		ifEmpty: [ {} asSrfi41Stream srfi41Singleton ]
		ifNotEmpty: [ | car withoutCarStream combinationsWithCar |
			car := self car.
			withoutCarStream := self cdr select: [ :each | each ~~ car ].
			combinationsWithCar := withoutCarStream combinations
				collect: [ :aStream | [ car ] srfi41ConsSrfi41Stream: aStream ].
			combinationsWithCar , withoutCarStream combinations ] ]
		srfi41Stream