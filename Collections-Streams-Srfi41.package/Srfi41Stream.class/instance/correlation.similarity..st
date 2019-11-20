as yet unclassified
correlation: aStream similarity: aBlock
	^ self cdrs allButLast
		zip: aStream srfi41Repeat
		with: [ :cdr :fixed | cdr zip: fixed with: aBlock ]