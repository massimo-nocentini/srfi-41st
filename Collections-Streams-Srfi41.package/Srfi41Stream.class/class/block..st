accessing
block: aBlock
	^ self new
		promise: Srfi41EvalLazy new -> aBlock;
		yourself