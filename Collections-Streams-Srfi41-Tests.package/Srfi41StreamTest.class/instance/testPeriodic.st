tests
testPeriodic
	20
		in: [ :n | 
			self
				assert: ({1 . -1} asSrfi41Stream periodic next: n)
				equals:
					{1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1 . 1 . -1.
					1 . -1 . 1 . -1}
				modulo: #asOrderedCollection ]