*Collections-Streams-Srfi41
srfi41CoRecursionWithInitials: args
	^ [ | whole |
	whole := nil.
	whole := (args
		foldr: [ :each :acc | [ [ each ] srfi41Cons: acc ] ]
		init: [ [ self value: whole ] ]) srfi41Stream  ] srfi41Stream