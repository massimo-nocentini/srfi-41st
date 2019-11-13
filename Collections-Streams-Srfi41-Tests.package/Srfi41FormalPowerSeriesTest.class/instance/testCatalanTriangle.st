tests
testCatalanTriangle
	| d |
	d := (1 - (1 - (4 * self t)) sqrt) / (2 * self t).
	10
		in: [ :size | 
			self
				assert:
					(d * (1 - (d * self t * self z)) reciprocal
						asArray2Drows: size
						columns: size) transposed
				equals: (size @ size) catalanTriangle ]