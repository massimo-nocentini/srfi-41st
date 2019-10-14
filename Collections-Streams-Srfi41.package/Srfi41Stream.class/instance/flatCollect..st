as yet unclassified
flatCollect: aBlockClosure
	^ self collect: aBlockClosure  with: [ :carBlock :cdrStream | carBlock value , cdrStream]