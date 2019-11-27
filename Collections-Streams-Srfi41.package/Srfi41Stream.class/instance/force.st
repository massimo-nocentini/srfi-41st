as yet unclassified
force
	[ | content |
	content := self promise.
	content key
		ifEager: [ ^ content value ]
		ifLazy: [ | aBlock promise_star freshContent |
			aBlock := content value.
			promise_star := aBlock value.
			freshContent := self promise.
			freshContent key
				ifEager: [ "noop" ]
				ifLazy: [ | freshPromise |
					freshPromise := promise_star promise.
					freshContent
						key: freshPromise key;
						value: freshPromise value ] ] ] repeat