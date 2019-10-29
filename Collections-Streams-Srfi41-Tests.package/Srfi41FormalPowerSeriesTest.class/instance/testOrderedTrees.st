tests
testOrderedTrees
	| tree forest list |
	tree := forest := list := nil.
	tree := [ 0 ] srfi41ConsFPS: [ forest ].
	forest := [ list value: tree ] srfi41StreamFPS.
	list := (1 asFPS - #t asFPS) reciprocal.
	self
		assert: forest
		equals:
			#(1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440)
				asFPS
		upto: 15
		modulo: #asOrderedCollection