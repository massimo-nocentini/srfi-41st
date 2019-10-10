*Collections-Streams-Srfi41-ArithSequences
srfi41RationalsWithoutDuplicates
	"(stream-iterate
    (lambda (x)
      (let* ((n (floor x)) (y (- x n)))
        (/ (- n -1 y))))
    1)"

	^ [ [ :x | 
	| n y |
	n := x floor.
	y := x - n.
	(n + 1 - y) reciprocal ] srfi41Iter value: self ] srfi41Stream