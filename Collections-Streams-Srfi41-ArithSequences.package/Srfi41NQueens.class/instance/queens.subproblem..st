as yet unclassified
queens: n subproblem: m
	^ [ m isZero
		ifTrue: [ {} asSrfi41Stream srfi41Singleton ]
		ifFalse: [ |  |
			 ( OrderedCollection new
				add: (self queens: n subproblem: m - 1);
				add: (1 to: n) asSrfi41Stream;
				asSrfi41Stream)
			 |? [ :p :nn | self isSafe: p at: nn ]
				|> [ :p :nn | p , nn srfi41Singleton ] ] ] srfi41Stream