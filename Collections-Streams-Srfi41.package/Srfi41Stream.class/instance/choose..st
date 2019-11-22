accessing
choose: k
	^ k isZero
		ifTrue: [ {} asSrfi41Stream srfi41Singleton ]
		ifFalse: [ [ self
				ifEmpty: #yourself
				ifNotEmpty: [ | car withoutCarStream combinationsWithCar |
					car := self car.
					withoutCarStream := self cdr select: [ :each | each ~~ car ].
					combinationsWithCar := (withoutCarStream choose: k - 1)
						collect: [ :aStream | [ car ] srfi41ConsSrfi41Stream: aStream ].
					combinationsWithCar , (withoutCarStream choose: k) ] ]
				srfi41Stream ]