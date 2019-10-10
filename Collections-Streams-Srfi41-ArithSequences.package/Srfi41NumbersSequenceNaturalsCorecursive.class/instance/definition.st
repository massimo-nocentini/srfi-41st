accessing
definition
	| nats |
	nats := nil. "to quite the quality checker."
	nats := [ 0 ] ~ [ nats collect: [ :n | n + 1 ] ].
	^ nats