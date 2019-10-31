accessing
empty
	^ self new
		promise: Srfi41EvalNil new -> nil;
		yourself