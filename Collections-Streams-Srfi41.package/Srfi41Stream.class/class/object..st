accessing
object: anObject
	^ self new
		promise: Srfi41EvalEager new -> anObject;
		yourself