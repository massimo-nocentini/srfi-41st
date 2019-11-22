testing
flatten
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ | carStream |
			carStream := self car
				ifSrfi41Stream: [ :aStream | aStream flatten ]
				ifNotSrfi41Stream: [ :anObj | self car srfi41Singleton ].
			carStream , self cdr flatten ] ] srfi41Stream