as yet unclassified
initsWithPrefixStream: aStream
	^ [ self
		ifEmpty: [ {} asSrfi41Stream ]
		ifNotEmpty: [ [ aStream , self car srfi41Singleton ]
				srfi41ConsInjectCar: [ :prefix | self cdr initsWithPrefixStream: prefix ] ] ]
		srfi41Stream