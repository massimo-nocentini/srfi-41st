evaluating
definition
	"	| fibs |
	fibs := nil.
	fibs := [ 0 ]
		~ [ [ 1 ] ~ [ fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ] ].
	^ fibs"

	^ [ :fibs | fibs zip: fibs cdr with: [ :n_1 :n | n_1 + n ] ]
		srfi41CoRecursionWithInitials: self initials