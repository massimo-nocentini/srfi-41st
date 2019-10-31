evaluating
definition
	| hamming |
	hamming := nil.
	hamming := [ 1 ]
		srfi41Cons: [ ((OrderedCollection new
				add: (hamming collect: [ :each | 2 * each ]);
				add: (hamming collect: [ :each | 3 * each ]);
				add: (hamming collect: [ :each | 5 * each ]);
				asSrfi41Stream) mergeWithSortBlock: #<) nextUnless: #= ].
	^ hamming