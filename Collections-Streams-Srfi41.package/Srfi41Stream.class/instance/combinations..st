accessing
combinations: k
	^ k isZero
		ifTrue: [ [ {} asSrfi41Stream ] srfi41Singleton ]
		ifFalse: [ [ self
				letCarCdr: [ :car :cdr | 
					| withoutCarStream |
					withoutCarStream := cdr select: [ :each | each ~= car ].
					(withoutCarStream combinations: k)
						,
							((withoutCarStream combinations: k - 1)
								collect: [ :aStream | [ car ] srfi41ConsStream:  aStream  ]) ]
				ifEmpty: [ {} asSrfi41Stream ] ] srfi41Stream ]