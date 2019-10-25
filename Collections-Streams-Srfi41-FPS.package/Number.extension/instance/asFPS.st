*Collections-Streams-Srfi41-FPS
asFPS
	^ Srfi41FormalPowerSeries new
		var: #t;
		stream: ([ self ] srfi41Cons: [ 0 srfi41Repeat ]);
		yourself