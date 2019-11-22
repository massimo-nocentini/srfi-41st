*Collections-Streams-Srfi41-FPS
asPolynomialOf: t
	^ Srfi41FormalPowerSeries new
		var: t;
		stream: (self ifEmpty: [ 0 srfi41Singleton ] ifNotEmpty: #yourself);
		yourself