tests
testLayers
	| ones twos threes streams fours fives |
	ones := 1 srfi41Repeat.
	twos := 2 srfi41Repeat.
	threes := 3 srfi41Repeat.
	fours := 4 srfi41Repeat.
	fives := 5 srfi41Repeat.
	streams := (OrderedCollection new
		add: ones;
		add: twos;
		add: threes;
		add: fours;
		add: fives;
		asSrfi41Stream) .
	self
		assert: (streams layers concat next: 30)
		equals: #(1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5)
		modulo: #asOrderedCollection