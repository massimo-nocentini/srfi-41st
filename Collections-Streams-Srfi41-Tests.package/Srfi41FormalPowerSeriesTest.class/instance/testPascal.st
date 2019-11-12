tests
testPascal
	10
		in: [ :size | 
			| pascalMatrix |
			pascalMatrix := Array2D
				rows: size
				columns: size
				tabulate: [ :n :k | n - 1 choose: k - 1 ].
			self
				assert:
					((1 - ((1 + self t) * self z)) reciprocal
						asArray2Drows: size
						columns: size)
				equals: pascalMatrix.
			self
				assert:
					(((Array
						with: (1 asFPSof: self t var)
						with: ({1 . 1} asSrfi41Stream asFPSof: self t var) negated)
						asSrfi41Stream asFPSof: self t var) reciprocal
						asArray2Drows: size
						columns: size)
				equals: pascalMatrix
			"self
				assert:
					(((1 - self t) reciprocal
						value:
							({(0 asFPSof: self z).
							(1 + self z)} asSrfi41Stream asFPSof: self t))
						asArray2Drows: size
						columns: size)
				equals: pascalMatrix" ]