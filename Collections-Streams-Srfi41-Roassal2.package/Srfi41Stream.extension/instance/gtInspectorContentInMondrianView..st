*Collections-Streams-Srfi41-Roassal2
gtInspectorContentInMondrianView: b
	b shape rectangle
		fillColor: Color white;
		borderColor: Color lightGray;
		withTextAbove: #yourself.
	b
		nodes: self asOrderedCollection
		forEach: [ :aValue | 
			aValue
				ifSrfi41Stream: [ :aStream | aStream gtInspectorPromisesInMondrianView: b ]
				ifNotSrfi41Stream: [ aValue ] ].
	b shape arrowedLine withShorterDistanceAttachPoint.
	b edges source: self promises connectFrom: #value to: [:aPromise | aPromise value nextLink ifEmpty: #yourself ifNotEmpty: #car].
	b layout tree.
	b build.
	^ b view