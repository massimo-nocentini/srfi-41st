tests
testPascal
	10
		in: [ :size | 
			self
				assert:
					(([ 1 asFPS ]
						srfi41Cons: [ [ {1 . 1} asFPS negated ]
								srfi41Cons: [ 0 srfi41Repeat collect: #asFPS ] ]) asFPS
						reciprocal asArray2Drows: size columns: size)
				equals:
					(Array2D
						rows: size
						columns: size
						tabulate: [ :n :k | n - 1 choose: k - 1 ]) ]