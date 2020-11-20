tests
testMerge
	30 in: [ :n | 
		self
			assert: (((OrderedCollection new
					   add: 2 srfi41Repeat;
					   add: 1 srfi41Repeat;
					   add: 3 srfi41Repeat;
					   asSrfi41Stream) mergeWithSortBlock: #<) next: n)
			equals: ((1 to: n) collect: [ :_ | 1 ])
			modulo: #asOrderedCollection ]