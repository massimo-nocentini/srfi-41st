as yet unclassified
select: aBlockClosure
  <type: #(#(α -> Boolean) × #(Stream α) -> #(Stream α))>
  ^ [ self 
			ifEmpty: [:s | {} asSrfi41Stream ] 
			ifNotEmpty: [ | car cdrBlock |
				cdrBlock := [ self cdr select: aBlockClosure ].
        		car := self car.
        		(aBlockClosure value: car) 
					ifTrue: [ [ car ] srfi41Cons: cdrBlock ] 
					ifFalse: cdrBlock ] ] srfi41Stream