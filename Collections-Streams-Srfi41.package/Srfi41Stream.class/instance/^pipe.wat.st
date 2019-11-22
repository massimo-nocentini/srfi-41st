as yet unclassified
|? aBlock
	^ self crossProduct
		select: [ :tuple | aBlock valueWithArguments: tuple ]