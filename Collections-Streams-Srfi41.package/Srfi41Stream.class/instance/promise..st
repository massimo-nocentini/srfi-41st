accessing
promise: anAssociation
	promise := anAssociation
		           ifEager: [ :anObject | 
			           (anObject isMemberOf: Srfi41ValueLink) ifTrue: [ 
				           (anObject isEmptySrfi41Stream: self) ifFalse: [ 
					           anObject stream: self ] ].
			           anAssociation ]
		           ifLazy: [ anAssociation ]