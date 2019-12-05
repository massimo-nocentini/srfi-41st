*Collections-Streams-Srfi41-Roassal2
gtInspectorCdrsViewIn: composite
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