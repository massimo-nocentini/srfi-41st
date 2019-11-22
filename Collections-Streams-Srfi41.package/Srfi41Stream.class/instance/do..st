as yet unclassified
do: aBlockClosure
	self
		ifEmpty: #yourself
		ifNotEmpty: [ aBlockClosure value: self car.
			self cdr do: aBlockClosure ]