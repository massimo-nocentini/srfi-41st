"
I am a stream that is suspended as a whole: my block answers the stream that I stand for, and my `tail` is that stream. I have no head, and `head` should not be sent to me; `collect:`, `select:` and `take:` evaluate my block and go on with its stream, and `interleave:` starts with the other stream.

```smalltalk
([ 1 >~ [ 2 >~ [ ] ] ] asSrfi41SICPStream take: 2) asArray.
""#(1 2)""
```

The message `select:` of a `Srfi41SICPStream` answers me when the block rejects the head. The messages that need a head, such as `at:` and `asArray`, do not work on me, nor beyond me when I am the rest of a stream; send `take:` first.
"
Class {
	#name : #Srfi41SICPSuspensionStream,
	#superclass : #Srfi41SICPStream,
	#category : #'Collections-Streams-Srfi41-SICP'
}

{ #category : #'reflective operations' }
Srfi41SICPSuspensionStream >> collect: block [

	^ self tail collect: block
]

{ #category : #accessing }
Srfi41SICPSuspensionStream >> head [

	self shouldNotImplement
]

{ #category : #converting }
Srfi41SICPSuspensionStream >> interleave: another [

	^ another interleaveSuspended: self
]

{ #category : #converting }
Srfi41SICPSuspensionStream >> interleaveSuspended: another [

	^ another tail interleaveSuspended: self
]

{ #category : #'reflective operations' }
Srfi41SICPSuspensionStream >> select: block [

	^ self tail select: block
]

{ #category : #'reflective operations' }
Srfi41SICPSuspensionStream >> take: n [

	^ self tail take: n
]
