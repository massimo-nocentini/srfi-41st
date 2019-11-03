as yet unclassified
elementwiseFPS: aSrfi41FormalPowerSeries do: aBlock
	^ (self stream
		zip: aSrfi41FormalPowerSeries asFPS stream
		with: aBlock) asFPS