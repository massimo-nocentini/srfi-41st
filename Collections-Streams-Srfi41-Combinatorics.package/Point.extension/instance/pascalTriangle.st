*Collections-Streams-Srfi41-Combinatorics
pascalTriangle
	^ Array2D
		rows: self x
		columns: self y
		tabulate: [ :n :k | n - 1 choose: k - 1 ]