*Collections-Streams-Srfi41-Extensions
foldr: aBlock init: init
	^ self
		ifEmpty: [ init value ]
		ifNotEmpty: [ aBlock
				value: self first
				value: (self allButFirst foldr: aBlock init: init) ]