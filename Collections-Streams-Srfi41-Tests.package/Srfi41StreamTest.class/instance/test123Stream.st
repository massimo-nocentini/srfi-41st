tests
test123Stream
	| aStream |
	aStream := [ 1 ]
		srfi41 cons: [ [ 2 ] srfi41 cons: [ [ 3 ] srfi41 cons: [ {} srfi41 stream ] ] ].
	self assert: aStream car equals: 1.
	self assert: aStream cadr equals: 2.
	self assert: aStream caddr equals: 3.
	self assert: aStream cdr cdr cdr isEmptyStream