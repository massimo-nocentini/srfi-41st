tests
testEmptyStream
	<gtExample>
	| emptyStream |
	emptyStream := {} asSrfi41Stream.
	self assert: emptyStream isEmpty.
	self assert: [ {} asSrfi41Stream ] srfi41Stream isEmpty.
	self
		should: [ [ {} ] srfi41Stream isEmpty ]
		raise: MessageNotUnderstood.
	self assert: [ {} asSrfi41Stream ] srfi41Delay isEmpty not.
	^ emptyStream