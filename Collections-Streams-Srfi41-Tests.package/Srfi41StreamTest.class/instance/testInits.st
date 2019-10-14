tests
testInits
	10
		in: [ :n | 
			self
				assert: ((1 to: n) asSrfi41Stream inits collect: #asArray)
				equals:
					(OrderedCollection new
						add: #();
						add: #(1);
						add: #(1 2);
						add: #(1 2 3);
						add: #(1 2 3 4);
						add: #(1 2 3 4 5);
						add: #(1 2 3 4 5 6);
						add: #(1 2 3 4 5 6 7);
						add: #(1 2 3 4 5 6 7 8);
						add: #(1 2 3 4 5 6 7 8 9);
						add: #(1 2 3 4 5 6 7 8 9 10);
						yourself)
				modulo: #asOrderedCollection ]