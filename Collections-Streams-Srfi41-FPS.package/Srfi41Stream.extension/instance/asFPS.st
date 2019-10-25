*Collections-Streams-Srfi41-FPS
asFPS
	^ Srfi41FormalPowerSeries new
		stream: [ self ifEmpty: [ 0 srfi41Repeat ] ] srfi41Stream;
		yourself