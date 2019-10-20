evaluating
definition
	^ [ :codes | 
	((codes car collect: (self curriedCons: 0))
		, (codes car reverse collect: (self curriedCons: 1)))
		srfi41Singleton ]
		srfi41CoRecursionWithInitials:
			{([ Array with: 0 ] srfi41Cons: [ (Array with: 1) srfi41Singleton ]) srfi41Singleton }