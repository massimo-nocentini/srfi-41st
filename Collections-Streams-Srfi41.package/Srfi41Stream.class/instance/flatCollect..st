as yet unclassified
flatCollect: aBlockClosure
	^ self
		collect: aBlockClosure
		with: [ :carBlock :cdrBlock | carBlock value , cdrBlock srfi41Stream ]