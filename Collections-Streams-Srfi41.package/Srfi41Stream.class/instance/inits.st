as yet unclassified
inits
	^ [ [ {} asSrfi41Stream ]
		srfi41ConsInjectCar: [ :prefix | self initsWithPrefixStream: prefix ] ]
		srfi41Stream