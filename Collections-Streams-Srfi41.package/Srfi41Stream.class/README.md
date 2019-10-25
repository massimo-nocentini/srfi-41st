!Srfi 41

Original document at *https://srfi.schemers.org/srfi-41/srfi-41.html*

""Title"" 
Streams

""Author"" 
Philip L. Bewig

""Status""
This SRFI is currently in ''final'' status. To see an explanation of each status that a SRFI can hold, see here. To comment on this SRFI, please *srfi-41@srfi.schemers.org*. See instructions here to subscribe to the list. You can access the discussion via the archive of the mailing list. You can access post-finalization messages via the archive of the mailing list.

    Received: 2007/10/24
    Revised: 2007/11/14
    Revised: 2007/11/14
    Revised: 2007/12/17
    Final: 2008/01/24
    Post-finalization improvement to stream-constant: 2015/11/2
    Draft: 2007/10/21 - 2007/12/22 

!!Abstract

Streams, sometimes called lazy lists, are a sequential data structure containing elements computed only on demand. A stream is either null or is a pair with a stream in its cdr. Since elements of a stream are computed only when accessed, streams can be infinite. Once computed, the value of a stream element is cached in case it is needed again.

Streams without memoization were first described by Peter Landin in 1965. Memoization became accepted as an essential feature of streams about a decade later. Today, streams are the signature data type of functional programming languages such as Haskell.

This Scheme Request for Implementation describes two libraries for operating on streams: a canonical set of stream primitives and a set of procedures and syntax derived from those primitives that permits convenient expression of stream operations. They rely on facilities provided by R6RS, including libraries, records, and error reporting. To load both stream libraries, load the baseline ${class:BaselineOfSrfi41}$.

!!Rationale

Harold Abelson and Gerald Jay Sussman discuss streams at length, giving a strong justification for their use. The streams they provide are represented as a cons pair with a promise to return a stream in its ==cdr==; for instance, a stream with elements the first three counting numbers is represented conceptually as ==(cons 1 (delay (cons 2 (delay (cons 3 (delay '()))))))==.
 
Philip Wadler, Walid Taha and David MacQueen describe such streams as odd because, regardless of their length, the parity of the number of constructors ==(delay, cons, '())== in the stream is odd.

The streams provided here differ from those of Abelson and Sussman, being represented as promises that contain a cons pair with a stream in its cdr; for instance, the stream with elements the first three counting numbers is represented conceptually as ==(delay (cons 1 (delay (cons 2 (delay (cons 3 (delay '())))))))==this is an even stream because the parity of the number of constructors in the stream is even.

Even streams are more complex than odd streams in both definition and usage, but they offer a strong benefit: they fix the off-by-one error of odd streams. Wadler, Taha and MacQueen show, for instance, that an expression like ==(stream->list 4 (stream-map / (stream-from 4 -1)))== evaluates to ==(1/4 1/3 1/2 1)== using even streams but fails with a divide-by-zero error using odd streams, because the next element in the stream, which will be ==1/0==, is evaluated before it is accessed. This extra bit of laziness is not just an interesting oddity; it is vitally critical in many circumstances, as will become apparent below.

When used effectively, the primary benefit of streams is improved modularity. Consider a process that takes a sequence of items, operating on each in turn. If the operation is complex, it may be useful to split it into two or more procedures in which the partially-processed sequence is an intermediate result. If that sequence is stored as a list, the entire intermediate result must reside in memory all at once; however, if the intermediate result is stored as a stream, it can be generated piecemeal, using only as much memory as required by a single item. This leads to a programming style that uses many small operators, each operating on the sequence of items as a whole, similar to a pipeline of unix commands.

In addition to improved modularity, streams permit a clear exposition of backtracking algorithms using the ''stream of successes'' technique, and they can be used to model generators and co-routines. The implicit memoization of streams makes them useful for building persistent data structures, and the laziness of streams permits some multi-pass algorithms to be executed in a single pass. Savvy programmers use streams to enhance their programs in countless ways.

There is an obvious space/time trade-off between lists and streams; lists take more space, but streams take more time (to see why, look at all the type conversions in the implementation of the stream primitives). Streams are appropriate when the sequence is truly infinite, when the space savings are needed, or when they offer a clearer exposition of the algorithms that operate on the sequence.

!!Specification

!!!The (streams primitive) library

The (streams primitive) library provides two mutually-recursive abstract data types: An object of the stream abstract data type is a promise that, when forced, is either stream-null or is an object of type stream-pair. An object of the stream-pair abstract data type contains a stream-car and a stream-cdr, which must be a stream. The essential feature of streams is the systematic suspensions of the recursive promises between the two data types.

α stream
  :: (promise stream-null)
  |  (promise (α stream-pair))
α stream-pair
  :: (promise α) × (promise (α stream))

The object stored in the stream-car of a stream-pair is a promise that is forced the first time the stream-car is accessed; its value is cached in case it is needed again. The object may have any type, and different stream elements may have different types. If the stream-car is never accessed, the object stored there is never evaluated. Likewise, the stream-cdr is a promise to return a stream, and is only forced on demand.

This library provides eight operators: constructors for stream-null and stream-pairs, type recognizers for streams and the two kinds of streams, accessors for both fields of a stream-pair, and a lambda that creates procedures that return streams.