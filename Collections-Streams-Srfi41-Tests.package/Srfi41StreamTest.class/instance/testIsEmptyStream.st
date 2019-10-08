tests
testIsEmptyStream
	self assert: {} asSrfi41Stream isEmptyStream.
	self assert: [ {} asSrfi41Stream ] srfi41Stream isEmptyStream.
	self
		should: [ [ {} ] srfi41Stream isEmptyStream ]
		raise: MessageNotUnderstood.
	self assert: [ {} asSrfi41Stream] srfi41Delay isEmptyStream not