*Collections-Streams-Srfi41-FPS
asFPS
	^ Srfi41FormalPowerSeries new
		var: self;
		stream:
			[ [ 0 ] srfi41Cons: [ [ 1 ] srfi41Cons: [ 0 srfi41Repeat ] ] ]
				srfi41Stream;
		yourself