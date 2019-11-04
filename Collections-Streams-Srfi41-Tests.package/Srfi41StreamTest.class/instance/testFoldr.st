tests
testFoldr
	20
		in: [ :n | 
			self
				assert: ((1 srfi41CountForward next: n) foldrStrict: #+ init: 0)
				equals: 210 ]