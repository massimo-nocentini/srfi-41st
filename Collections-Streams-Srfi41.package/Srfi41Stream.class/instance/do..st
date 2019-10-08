as yet unclassified
do: aBlockClosure
	
	self  ifEmpty: [  ] ifNotEmpty: [ aBlockClosure value: self car. self cdr do: aBlockClosure ]