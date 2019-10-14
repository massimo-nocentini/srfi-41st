as yet unclassified
initsWithPrefixStream: aStream
	^ [ self
		letCarCdr: [ :car :cdr | 
			| prefix |
			prefix := aStream , car srfi41Singleton.
			[ prefix ] srfi41Cons: [ cdr initsWithPrefixStream: prefix ] ]
		ifEmpty: [ {  } asSrfi41Stream  ] ] srfi41Stream