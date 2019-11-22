as yet unclassified
|> aBlock
	^ self collect: [ :tuple | aBlock valueWithArguments: tuple ]