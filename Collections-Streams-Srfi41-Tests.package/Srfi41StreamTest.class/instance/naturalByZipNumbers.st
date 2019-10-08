tests
naturalByZipNumbers
	| nats |
	nats := [ 0 ] ~ [ nats collect: [ :n_1 | n_1 + 1 ] ] .
	^ nats