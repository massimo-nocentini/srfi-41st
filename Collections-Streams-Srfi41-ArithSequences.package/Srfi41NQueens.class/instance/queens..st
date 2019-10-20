as yet unclassified
queens: m
	^ [ m isZero
		ifTrue: [ {} asSrfi41Stream srfi41Singleton ]
		ifFalse: [ (1 to: 8) asSrfi41Stream
				collect: [ :n | 
					((self queens: m - 1)
						collect: [ :p | 
							(self isSafe: p at: n)
								ifTrue: [ p , n srfi41Singleton ]
								ifFalse: [ {  } asSrfi41Stream  ] ]) nextWhile: [ :aStream | aStream isEmptyStream  not ] ] ] ] srfi41Stream