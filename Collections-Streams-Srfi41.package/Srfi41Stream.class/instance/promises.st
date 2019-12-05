testing
promises
	^ self promise
		  ifEager: [ :aValue | 
			  (aValue isEmptySrfi41Stream: self)
				  ifTrue: [ Array new ]
				  ifFalse: [ 
					  Array
						  with: self promise
						  withAll: (aValue cdrParentSrfi41Stream: self) promises ] ]
		  ifLazy: [ :aBlock | Array with: self promise ]