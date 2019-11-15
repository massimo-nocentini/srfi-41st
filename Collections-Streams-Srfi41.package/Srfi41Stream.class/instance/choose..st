accessing
choose: k
	^ [ k isZero
		ifTrue: [ {} asSrfi41Stream srfi41Singleton ]
		ifFalse: [ self
				letCarCdr: [ :car :cdr | 
					| withoutCarStream combinationsWithCar |
					withoutCarStream := cdr select: [ :each | each ~~ car ].
					combinationsWithCar := (withoutCarStream choose: k - 1)
						collect: [ :aStream | [ car ] srfi41ConsSrfi41Stream: aStream ].
					combinationsWithCar , (withoutCarStream choose: k) ]
				ifEmpty: [ {} asSrfi41Stream ] ] ] srfi41Stream