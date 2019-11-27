accessing
tagClass: aClass value: anObject
	^ self new
		promise: aClass new -> anObject;
		yourself