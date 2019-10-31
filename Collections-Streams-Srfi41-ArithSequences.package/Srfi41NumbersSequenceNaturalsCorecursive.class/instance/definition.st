accessing
definition
	| nats |
	nats := nil.
	nats := [ 0 ] srfi41Cons: [ nats collect: #increase ].
	^ nats