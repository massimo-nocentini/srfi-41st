tests
testIntersperse
	| ones |
	ones := [ 1 ] srfi41Repeat.
	self
		assert:
			(((ones intersperse: 2) next: 10)
				collect: [ :s | (s next: 10) asArray ])
		equals:
			(OrderedCollection new
				add: #(2 1 1 1 1 1 1 1 1 1);
				add: #(1 2 1 1 1 1 1 1 1 1);
				add: #(1 1 2 1 1 1 1 1 1 1);
				add: #(1 1 1 2 1 1 1 1 1 1);
				add: #(1 1 1 1 2 1 1 1 1 1);
				add: #(1 1 1 1 1 2 1 1 1 1);
				add: #(1 1 1 1 1 1 2 1 1 1);
				add: #(1 1 1 1 1 1 1 2 1 1);
				add: #(1 1 1 1 1 1 1 1 2 1);
				add: #(1 1 1 1 1 1 1 1 1 2);
				asArray)
		modulo: #asOrderedCollection