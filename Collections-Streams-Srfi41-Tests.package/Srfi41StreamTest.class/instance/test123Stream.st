tests
test123Stream
	| aStream |
	aStream := [ 1 ]
		srfi41Cons: [ [ 2 ] srfi41Cons: [ [ 3 ] srfi41Cons: [ {} asSrfi41Stream ] ] ].
	self assert: aStream car equals: 1.
	self assert: aStream cadr equals: 2.
	self assert: aStream caddr equals: 3.
	self assert: aStream cdr cdr cdr isEmptyStream.
	self should: [ aStream cdr cdr cdr cdr ] raise: ShouldNotImplement