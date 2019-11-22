as yet unclassified
layersBy: n
	^ [ | carBlock |
	carBlock := [ (self collect: [ :aStream | aStream next: n ]) concat ].
	carBlock srfi41Cons: [ (self collect: #cdr) layersBy: n ] ]
		srfi41Stream