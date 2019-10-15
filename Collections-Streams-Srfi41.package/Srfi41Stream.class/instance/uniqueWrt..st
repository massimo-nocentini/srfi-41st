accessing
uniqueWrt: aPredicate
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ [ self car ]
				srfi41Cons: [ (self cdr
						select: [ :each | (aPredicate value: self car value: each) not ])
						uniqueWrt: aPredicate ] ] ] srfi41Stream