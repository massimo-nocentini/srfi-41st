as yet unclassified
inits
	^ [ | prefix |
	prefix := {} asSrfi41Stream.
	[ prefix ]
		srfi41Cons: [ self initsWithPrefixStream: prefix] ]
		srfi41Stream