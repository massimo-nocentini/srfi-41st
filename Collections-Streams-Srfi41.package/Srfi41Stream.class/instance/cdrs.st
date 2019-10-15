as yet unclassified
cdrs
	"Aka #tails."

	^ [ [ self ]
		srfi41Cons: [ self
				ifEmpty: [ {} asSrfi41Stream ]
				ifNotEmpty: [  self cdr cdrs ] ] ] srfi41Stream