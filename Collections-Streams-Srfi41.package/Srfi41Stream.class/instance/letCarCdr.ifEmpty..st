as yet unclassified
letCarCdr: aBlock ifEmpty: eBlock

	^ self ifEmpty: eBlock ifNotEmpty: [ aBlock value: self car value: self cdr ]