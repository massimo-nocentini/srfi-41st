Extension { #name : #Srfi41FormalPowerSeries }

{ #category : #'*Collections-Streams-Srfi41-Roassal2' }
Srfi41FormalPowerSeries >> gtInspectorGraphViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	^ composite roassal2
		  title: 'Graph';
		  initializeView: [ 
			  | b ds |
			  b := RTGrapher new.
			  "b extent: 300 @ 300."
			  ds := RTData new.
			  "ds dotShape ellipse color: (Color blue alpha: 0.5)."
			  ds noDot.
			  ds points: (self stream next: 100) asOrderedCollection.
			  ds connect.
			  ds y: #yourself.
			  b add: ds.
			  b axisXWithNumberOfTicks: 3.
			  b axisYWithNumberOfTicks: 4.
			  b build.
			  b view ];
		  yourself
]
