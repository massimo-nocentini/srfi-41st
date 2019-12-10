*Collections-Streams-Srfi41-Roassal2
gtInspectorPromisesViewIn: composite
	<gtInspectorPresentationOrder: 20>
	^ composite roassal2
		  title: 'Promises';
		  initializeView: [ RTMondrian new ];
		  painting: [ :b | self gtInspectorContentInMondrianView: b ];
		  yourself