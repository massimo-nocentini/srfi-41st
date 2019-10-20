as yet unclassified
check: aPoint with: anotherPoint
	|i j m n|
	i := aPoint x.
	j := aPoint y.
	m := anotherPoint x .
	n := anotherPoint y.
	^ j = n or: [ i + j = (m + 1 + n) or: [ i - j = (m + 1 - n) ] ]