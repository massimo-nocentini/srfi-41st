accessing
periodic
	| Y |
	Y := nil.
	Y := self foldr: #srfi41Cons: init: [ Y ].
	^ Y