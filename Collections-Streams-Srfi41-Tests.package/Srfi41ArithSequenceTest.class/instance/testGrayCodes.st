tests
testGrayCodes
	6
		in: [ :n | 
			self
				assert: (Srfi41NumbersSequence binaryReflectedGrayCodes next: n)
				equals:
					(OrderedCollection new
						add: #(#());
						add: #(#(0) #(1));
						add: #(#(0 0) #(0 1) #(1 1) #(1 0));
						add:
							#(#(0 0 0) #(0 0 1) #(0 1 1) #(0 1 0) #(1 1 0) #(1 1 1) #(1 0 1) #(1 0 0));
						add:
							#(#(0 0 0 0) #(0 0 0 1) #(0 0 1 1) #(0 0 1 0) #(0 1 1 0) #(0 1 1 1) #(0 1 0 1) #(0 1 0 0) #(1 1 0 0) #(1 1 0 1) #(1 1 1 1) #(1 1 1 0) #(1 0 1 0) #(1 0 1 1) #(1 0 0 1) #(1 0 0 0));
						add:
							#(#(0 0 0 0 0) #(0 0 0 0 1) #(0 0 0 1 1) #(0 0 0 1 0) #(0 0 1 1 0) #(0 0 1 1 1) #(0 0 1 0 1) #(0 0 1 0 0) #(0 1 1 0 0) #(0 1 1 0 1) #(0 1 1 1 1) #(0 1 1 1 0) #(0 1 0 1 0) #(0 1 0 1 1) #(0 1 0 0 1) #(0 1 0 0 0) #(1 1 0 0 0) #(1 1 0 0 1) #(1 1 0 1 1) #(1 1 0 1 0) #(1 1 1 1 0) #(1 1 1 1 1) #(1 1 1 0 1) #(1 1 1 0 0) #(1 0 1 0 0) #(1 0 1 0 1) #(1 0 1 1 1) #(1 0 1 1 0) #(1 0 0 1 0) #(1 0 0 1 1) #(1 0 0 0 1) #(1 0 0 0 0));
						yourself)
				modulo: #asOrderedCollection ]