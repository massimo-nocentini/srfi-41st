*Collections-Streams-Srfi41-Extensions
S: x 
	"x y z = x z (y z)"
^[:y |
	| X |
	X := x value: self.
	 X value: (y value: self)]