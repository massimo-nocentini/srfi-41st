as yet unclassified
cdrs
	"Aka #tails."

	^ [ [ self ]
		srfi41Cons: [ self letCarCdr: [ :_ :cdr | cdr cdrs ] ifEmpty: [ {  } asSrfi41Stream  ] ] ]
		srfi41Stream