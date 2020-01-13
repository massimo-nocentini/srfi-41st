to remove as soon as possible
links
	^ self promise
		  ifEager: [ :aValue | 
			  (aValue isEmptySrfi41Stream: self)
				  ifTrue: [ Array new ]
				  ifFalse: [ Array with: aValue withAll: self cdr links ] ]
		  ifLazy: [ :aBlock | Array with: aBlock ]