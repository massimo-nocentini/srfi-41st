as yet unclassified
select: aBlockClosure
	<type: #(#(α -> Boolean) × #(Stream α) -> #(Stream α))>
	^ [ self
		ifEmpty: [ Srfi41Stream empty ]
		ifNotEmpty: [ | car cdr |
			cdr := self cdr select: aBlockClosure.
			car := self car.
			(aBlockClosure value: car)
				ifTrue: [ [ car ] srfi41ConsStream: cdr ]
				ifFalse: [ cdr ] ] ] srfi41Stream