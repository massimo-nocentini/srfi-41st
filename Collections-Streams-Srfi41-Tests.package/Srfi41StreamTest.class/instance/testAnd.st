tests
testAnd
	self assert: {  } asSrfi41Stream and.
	self assert: { true. true. true } asSrfi41Stream and.
	self deny: { true. false. true } asSrfi41Stream and