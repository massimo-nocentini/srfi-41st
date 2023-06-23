Extension { #name : #Srfi41Stream }

{ #category : #'*Collections-Streams-Srfi41-Roassal2' }
Srfi41Stream >> gtInspectorCdrsViewIn: composite [
	<gtInspectorPresentationOrder: 10>
	^ composite roassal2
		  title: 'Cdrs';
		  initializeView: [ RTMondrian new ];
		  painting: [ :b | 
			  b shape circle size: 30.
			  b nodes: (self cdrs allButLast next: 30) asOrderedCollection.
			  b shape arrowedLine withShorterDistanceAttachPoint.
			  b edges connectTo: #cdr.
			  b layout forceWithCharge: -500.
			  b build.
			  b view ];
		  yourself
]

{ #category : #'*Collections-Streams-Srfi41-Roassal2' }
Srfi41Stream >> gtInspectorContentInMondrianView: b [
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
]

{ #category : #'*Collections-Streams-Srfi41-Roassal2' }
Srfi41Stream >> gtInspectorPromisesInMondrianView: b [
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
]

{ #category : #'*Collections-Streams-Srfi41-Roassal2' }
Srfi41Stream >> gtInspectorPromisesViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal2
		  title: 'Promises';
		  initializeView: [ RTMondrian new ];
		  painting: [ :b | self gtInspectorContentInMondrianView: b ];
		  yourself
]
