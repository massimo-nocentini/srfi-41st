as yet unclassified
permutations
	"(define-stream (perms xs)
  (if (stream-null? xs)
      (stream (stream))
      (stream-concat
        (stream-map
          (lambda (ys)
            (interleave (stream-car xs) ys))
          (perms (stream-cdr xs))))))"

	^ [ self
		ifEmpty: [ [ {} asSrfi41Stream ] srfi41Singleton ]
		ifNotEmpty: [ (self cdr permutations collect: [ :each | each interleave: self car ])concat ] ] srfi41Stream