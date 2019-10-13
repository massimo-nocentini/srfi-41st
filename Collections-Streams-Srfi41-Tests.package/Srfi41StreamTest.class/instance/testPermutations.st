tests
testPermutations
	| ones |
	4
		in: [ :n | 
			ones := (1 to: n) asSrfi41Stream.
			self
				assert:
					((ones permutations next: n factorial) collect: [ :s | (s next: 10) asArray ])
				equals:
					(OrderedCollection new
						add: #(1 2 3 4);
						add: #(2 1 3 4);
						add: #(2 3 1 4);
						add: #(2 3 4 1);
						add: #(1 3 2 4);
						add: #(3 1 2 4);
						add: #(3 2 1 4);
						add: #(3 2 4 1);
						add: #(1 3 4 2);
						add: #(3 1 4 2);
						add: #(3 4 1 2);
						add: #(3 4 2 1);
						add: #(1 2 4 3);
						add: #(2 1 4 3);
						add: #(2 4 1 3);
						add: #(2 4 3 1);
						add: #(1 4 2 3);
						add: #(4 1 2 3);
						add: #(4 2 1 3);
						add: #(4 2 3 1);
						add: #(1 4 3 2);
						add: #(4 1 3 2);
						add: #(4 3 1 2);
						add: #(4 3 2 1);
						asArray)
				modulo: #asOrderedCollection ]