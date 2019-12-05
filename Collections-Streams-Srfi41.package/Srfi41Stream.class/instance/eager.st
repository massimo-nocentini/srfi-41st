testing
eager
	self isEmpty ifFalse: [ 
		self car.
		self cdr eager ]