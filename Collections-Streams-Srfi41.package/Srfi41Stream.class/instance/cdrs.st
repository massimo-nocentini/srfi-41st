as yet unclassified
cdrs
	"Aka #tails."

	^ [ self ]
		srfi41Cons: [ self ifEmpty: #yourself ifNotEmpty: [ self cdr cdrs ] ]