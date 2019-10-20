as yet unclassified
isSafe: p at: n
	| m |
	m := p size.
	^ ((1 to: m) asSrfi41Stream
		zip: p
		with: [ :i :j | 
			(self
				check: i @ j
				with: m @  n) not ]) and