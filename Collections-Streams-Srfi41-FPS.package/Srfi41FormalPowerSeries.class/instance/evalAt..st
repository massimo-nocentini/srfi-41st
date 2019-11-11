accessing
evalAt: aNumber
	^ self stream scan1: [ :acc :each | aNumber * each + acc ]