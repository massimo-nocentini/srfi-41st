testing
flatten
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ ((self car isMemberOf: Srfi41Stream)
				ifTrue: [ self car flatten ]
				ifFalse: [ self car srfi41Singleton  ]) , self cdr flatten ] ]
		srfi41Stream