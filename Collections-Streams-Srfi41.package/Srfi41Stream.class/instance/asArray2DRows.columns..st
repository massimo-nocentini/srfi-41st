testing
asArray2DRows: rows columns: cols
	^ Array2D
		rows: rows
		columns: cols
		tabulate: [ :n :k | (self at: n) at: k ]