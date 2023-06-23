Extension { #name : #BlockClosure }

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> >>= aStream [
	^ (aStream collect: self) dovetailCounterClockwise concat
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> >>~ aStream [
	^ [ aStream
			ifEmpty: #yourself
			ifNotEmpty: [ [ self value: aStream car ] srfi41Stream + (self >>~ aStream cdr) ] ]
		srfi41Stream

	"	^ (aStream collect: self) dovetailCounterClockwise concat"
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41Cons: ontoBlock [
	^ ValueLink carBlock: self cdrBlock: ontoBlock
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41ConsInjectCar: ontoBlock [
	"This is mandatory in order to evaluate myself exactly one time, 
	to protect against side-effect code in myself such as random computation"

	^ [ | car |
	car := self value.
	[ car ] srfi41Cons: [ ontoBlock value: car ] ] srfi41Stream
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41ConsSrfi41Stream: aStream [
	^ ValueLink carBlock: self cdrStream: aStream
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41Delay [
	^ [ self value srfi41Stream ] srfi41Stream
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41Iter [
	^ [ :x | self srfi41Iter: x ]
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41Iter: x [
	^ [ x ] srfi41Cons: [ self srfi41Iter: (self value: x) ]
]

{ #category : #'*Collections-Streams-Srfi41' }
BlockClosure >> srfi41Stream [
	^ Srfi41Stream block: self
]
