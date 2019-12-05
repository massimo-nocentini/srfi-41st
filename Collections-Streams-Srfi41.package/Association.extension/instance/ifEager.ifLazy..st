*Collections-Streams-Srfi41
ifEager: eBlock ifLazy: lBlock
	^ (self key
		   ifTrue: [ eBlock ]
		   ifFalse: [ lBlock ]) cull: self value