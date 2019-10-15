*Collections-Streams-Srfi41-Extensions
S: x s: y
	"x y z = (x z) (y z)"

	| X |
	X := x value: self.
	^ X value: (y value: self)