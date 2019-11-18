tests
testBinaryTrees
	| tree |
	tree := nil.
	tree := [ 1 ] srfi41ConsFPS: [ tree ** 2 ] of: self t var.
	self
		assert: tree
		equals:
			(#(1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440)
				asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection