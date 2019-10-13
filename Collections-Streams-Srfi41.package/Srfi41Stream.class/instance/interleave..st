as yet unclassified
interleave: x
	"(define-stream (interleave x yy)
  (stream-match yy
    (() (stream (stream x)))
    ((y . ys)
      (stream-append
        (stream (stream-cons x yy))
        (stream-map
          (lambda (z) (stream-cons y z))
          (interleave x ys))))))"

	^ [self
		ifEmpty: [ [ x ] srfi41Singleton srfi41Singleton ]
		ifNotEmpty: [ [ [ x ] srfi41Cons: [ self ] ] srfi41Singleton
				,
					((self cdr interleave: x)
						collect: [ :z | [ self car ] srfi41Cons: [ z ] ]) ]] srfi41Stream 