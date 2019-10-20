as yet unclassified
reverse
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [  self cdr reverse  , [ self car ] srfi41Stream ] ]
		srfi41Stream