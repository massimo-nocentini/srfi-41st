testing
asArray2Drows: rows columns: cols
	^ Array2D
		rows: rows
		columns: cols
		tabulate: [ :n :k | (self at: n) at: k ]