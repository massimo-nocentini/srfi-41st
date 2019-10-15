evaluating
definition

	^ 2 srfi41CountForward
		uniqueWrt: [ :car :each | each isDivisibleBy: car ]