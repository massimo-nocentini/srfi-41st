as yet unclassified
cdrs
	"Aka #tails."

	^ [ self ] srfi41Cons: [ self ifNotEmpty: [ self cdr cdrs ] ]