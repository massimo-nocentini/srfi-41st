as yet unclassified
zipLongest: aStream with: aBlock
	^ [ | sentinel predicate cdr zipped |
	sentinel := Object new.
	predicate := [ :o | sentinel == o ].
	cdr := sentinel srfi41Repeat.
	zipped := self , cdr
		zip: aStream , cdr
		with: [ :a :b | 
			(a == sentinel and: [ b == sentinel ])
				ifTrue: [ sentinel ]
				ifFalse: [ aBlock value: a value: b value: predicate ] ].
	zipped nextWhile: [ :each | each ~~ sentinel ] ] srfi41Stream