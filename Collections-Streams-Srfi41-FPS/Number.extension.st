Extension { #name : #Number }

{ #category : #'*Collections-Streams-Srfi41-FPS' }
Number >> adaptToFPS: aSrfi41FormalPowerSeries andSend: aString [
	^ aSrfi41FormalPowerSeries
		perform: aString
		with: (self asFPSof: aSrfi41FormalPowerSeries var)
]

{ #category : #'*Collections-Streams-Srfi41-FPS' }
Number >> asFPSof: t [
	^ ([ self ] srfi41Cons: [ 0 srfi41Repeat ]) asFPSof: t
]
