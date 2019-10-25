as yet unclassified
* aSrfi41FormalPowerSeries
	^ [ self stream
		convolution: aSrfi41FormalPowerSeries stream
		f: #*
		combiner: [ :a :b | a zip: b with: #+ ] ] srfi41Stream asFPS