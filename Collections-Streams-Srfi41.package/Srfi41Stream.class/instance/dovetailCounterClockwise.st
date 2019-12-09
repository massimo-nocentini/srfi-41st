as yet unclassified
dovetailCounterClockwise
	^ [ | sentinel suffix diagonals |
	sentinel := Object new.
	suffix := sentinel srfi41Repeat.
	diagonals := (self collect: [ :aStream | aStream , suffix ])
		dovetailWith: [ :car :cdr | cdr , car srfi41Singleton ].
	(diagonals
		collect: [ :aStream | aStream select: [ :each | each ~~ sentinel ] ])
		nextWhile: [ :aStream | (aStream allSatisfy: [ :each | each == sentinel ]) not ] ]
		srfi41Stream