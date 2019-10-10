as yet unclassified
naturalsForInteger: anInteger
	^ [ [ :x | x + 1 ] srfi41Iter value: anInteger ] srfi41Stream