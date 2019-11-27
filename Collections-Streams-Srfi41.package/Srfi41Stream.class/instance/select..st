as yet unclassified
select: aBlockClosure
	<type: #(#(α -> Boolean) × #(Stream α) -> #(Stream α))>
	^ [ self
		ifEmpty: #yourself
		ifNotEmpty: [ | car cdr |
			cdr := self cdr select: aBlockClosure.
			car := self car.
			(aBlockClosure value: car)
				ifTrue: [ [ car ] srfi41ConsSrfi41Stream: cdr ]
				ifFalse: [ cdr ] ] ] srfi41Stream