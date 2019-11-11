*Collections-Streams-Srfi41-FPS
asFPSof: t
	^ Srfi41FormalPowerSeries new
		var: t;
		stream: self , 0 srfi41Repeat;
		yourself