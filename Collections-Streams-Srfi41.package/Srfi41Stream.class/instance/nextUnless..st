accessing
nextUnless: aPredicate
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ [ self car ]
				srfi41Cons: [ (self cdr
						select: [ :each | (aPredicate value: each  value: self car) not ])
						nextUnless: aPredicate ] ] ] srfi41Stream