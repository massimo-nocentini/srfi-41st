accessing
definition
	"| nats |
	nats := nil.	
	nats := [ 0 ] ~ [ nats collect: [ :n | n + 1 ] ].
	^ nats"

	^ [ :nats | nats collect: #increase ] srfi41CoRecursionWithInitials: {0}