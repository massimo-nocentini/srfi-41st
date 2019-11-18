accessing
value: aSrfi41FormalPowerSeries
	^ [ aSrfi41FormalPowerSeries car isZero
		ifTrue: [ [ self car ]
				srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr
						* (self cdr value: aSrfi41FormalPowerSeries) ]
				of: aSrfi41FormalPowerSeries var ]
		ifFalse: [ | composition |
			composition := self cdr value: aSrfi41FormalPowerSeries.
			self car + (aSrfi41FormalPowerSeries car * composition)
				+
					([ 0 ]
						srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr * composition ]
						of: self var) ] ] srfi41StreamFPSof: self var