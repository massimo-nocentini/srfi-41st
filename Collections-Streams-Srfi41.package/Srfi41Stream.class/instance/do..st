as yet unclassified
do: aBlockClosure
	self
		ifNotEmpty: [ aBlockClosure value: self car.
			self cdr do: aBlockClosure ]