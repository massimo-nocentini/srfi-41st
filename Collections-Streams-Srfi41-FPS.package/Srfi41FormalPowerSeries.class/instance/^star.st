as yet unclassified
* aSrfi41FormalPowerSeries
	^ self var = aSrfi41FormalPowerSeries var
		ifTrue: [ [ self stream
				convolution: aSrfi41FormalPowerSeries stream
				f: #*
				combiner: [ :a :b | a zip: b with: #+ ] ] srfi41Stream
				asFPSof: self var ]
		ifFalse: [ (aSrfi41FormalPowerSeries stream collect: [ :each | each * self ])
				asFPSof: aSrfi41FormalPowerSeries var ]