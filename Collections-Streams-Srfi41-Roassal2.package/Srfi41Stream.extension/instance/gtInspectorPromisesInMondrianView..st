*Collections-Streams-Srfi41-Roassal2
gtInspectorPromisesInMondrianView: b
	b shape rectangle
		fillColor: Color white;
		borderColor: Color lightGray;
		withTextAbove: [ :aPromise | 
			aPromise ifEager: #value ifLazy: [ #toBeEvaluated ] ].
	b nodes: self promises forEach: [ :aPromise | 
		aPromise
			ifEager: [ :aValue | 
				aValue value
					ifSrfi41Stream: [ :aStream | 
					aStream gtInspectorPromisesInMondrianView: b ]
					ifNotSrfi41Stream: [ aPromise ] ]
			ifLazy: [ aPromise ] ].
	b shape arrowedLine withShorterDistanceAttachPoint.
	b edges connectTo: [ :aPromise | 
		aPromise ifEager: [ :aValue | aValue nextLink promise ] ifLazy: [  ] ].
	b layout tree.
	b build.
	^ b view