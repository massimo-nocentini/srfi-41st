*Collections-Streams-Srfi41-FPS
adaptToFPS: aSrfi41FormalPowerSeries andSend: aString
	^ aSrfi41FormalPowerSeries
		perform: aString
		with: (self asFPSof: aSrfi41FormalPowerSeries var)