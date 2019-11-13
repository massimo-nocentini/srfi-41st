evaluating
definition
	^ 1 srfi41CountForward
		collect: [ :n | 
			| w |
			w := Float e ** (2 * Float pi / n) i.
			(0 to: n - 1) collect: [ :j | w raisedToInteger: j ] ]