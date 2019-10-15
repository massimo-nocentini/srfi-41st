as yet unclassified
do: aBlockClosure
	self isEmptyStream ifFalse: [ aBlockClosure value: self car.
			self cdr do: aBlockClosure ]