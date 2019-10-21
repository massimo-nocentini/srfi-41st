as yet unclassified
reverse
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ self cdr reverse ,  self car srfi41Singleton  ] ]
		srfi41Stream