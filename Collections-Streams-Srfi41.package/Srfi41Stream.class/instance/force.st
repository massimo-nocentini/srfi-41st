as yet unclassified
force
	[ | content |
	content := self promise.
	content key

		ifEager: [ ^ content value ]
		ifLazy: [ | promise_star freshContent |
			promise_star := content value value.
			freshContent := self promise.
			freshContent key
				ifEager: [ "noop" ]
				ifLazy: [ | freshPromise |
					freshPromise := promise_star promise.
					freshContent
						key: freshPromise key;
						value: freshPromise value.
					promise_star promise: freshContent ] ] ] repeat