as yet unclassified
* aSrfi41FormalPowerSeries
	^ aSrfi41FormalPowerSeries
		ifFPS: [ self var = aSrfi41FormalPowerSeries var
				ifTrue: [ (self stream
						convolution: aSrfi41FormalPowerSeries stream
						f: #*
						combiner: [ :a :b | a zip: b with: #+ ]) asFPSof: self var ]
				ifFalse: [ (aSrfi41FormalPowerSeries stream collect: [ :each | self * each ])
						asFPSof: aSrfi41FormalPowerSeries var ] ]
		ifNotFPS: [ aSrfi41FormalPowerSeries
				adaptToFPS: self
				andSend: thisContext selector ]