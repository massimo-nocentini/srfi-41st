tests
testOrderedTrees
	| tree forest list |
	tree := forest := list := nil.
	tree := [ [ 0 ] srfi41Cons: [ forest stream ] ] srfi41Stream asFPS.
	list := 1 srfi41Repeat asFPS.
	forest := [ (list value: tree) stream ] srfi41Stream asFPS.
	self
		assert: tree
		equals:
			#(0 1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900) asFPS
		upto: 15
		modulo: #asOrderedCollection