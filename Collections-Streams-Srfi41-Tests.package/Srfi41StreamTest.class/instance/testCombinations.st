tests
testCombinations
	| ones |
	4
		in: [ :n | 
			ones := (1 to: n) asSrfi41Stream.
			self
				assert: (ones combinations collect: #asArray)
				equals:
					(OrderedCollection new
						add: #(1 2 3 4);
						add: #(1 2 3);
						add: #(1 2 4);
						add: #(1 2);
						add: #(1 3 4);
						add: #(1 3);
						add: #(1 4);
						add: #(1);
						add: #(2 3 4);
						add: #(2 3);
						add: #(2 4);
						add: #(2);
						add: #(3 4);
						add: #(3);
						add: #(4);
						add: #();
						asArray)
				modulo: #asOrderedCollection ]