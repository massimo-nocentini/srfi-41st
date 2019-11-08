as yet unclassified
asArray2Drows: rows columns: cols
	^ Array2D
		rows: rows
		columns: cols
		tabulate: [ :n :k | (self stream at: n) stream at: k ]