as yet unclassified
select: aBlockClosure
	^ [ self
		ifEmpty: [ Srfi41Stream empty ]
		ifNotEmpty: [ | car cdr|
			cdr := self cdr select: aBlockClosure.
			car := self car.
			(aBlockClosure value: car)
				ifTrue: [ [ car ] srfi41Cons: [ cdr ] ]
				ifFalse: [ cdr ] ] ] srfi41Stream