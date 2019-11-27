accessing
object: anObject
	^ self promise: (Association srfi41Eager: anObject)