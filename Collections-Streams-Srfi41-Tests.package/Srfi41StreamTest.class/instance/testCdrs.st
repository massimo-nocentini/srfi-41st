tests
testCdrs
	10
		in: [ :n | 
			self
				assert: ((1 to: n) asSrfi41Stream cdrs collect: #asArray)
				equals:
					(OrderedCollection new
						add: #(1 2 3 4 5 6 7 8 9 10);
						add: #(2 3 4 5 6 7 8 9 10);
						add: #(3 4 5 6 7 8 9 10);
						add: #(4 5 6 7 8 9 10);
						add: #(5 6 7 8 9 10);
						add: #(6 7 8 9 10);
						add: #(7 8 9 10);
						add: #(8 9 10);
						add: #(9 10);
						add: #(10);
						add: #();
						yourself)
				modulo: #asOrderedCollection ]