as yet unclassified
allButLast
	^ self
		ifNotEmpty: [ self cdr
				ifNotEmpty: [ [ self car ] srfi41Cons: [ self cdr allButLast ] ] ]