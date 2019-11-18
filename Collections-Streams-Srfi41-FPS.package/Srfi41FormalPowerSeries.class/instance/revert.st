accessing
revert
	"Theoretically we should ensure that `self assert: self car equals: 0"

	| Y |
	Y := nil.
	Y := [ self car ]
		srfi41ConsFPS: [ (self cdr value: Y) reciprocal ]
		of: self var.
	^ Y