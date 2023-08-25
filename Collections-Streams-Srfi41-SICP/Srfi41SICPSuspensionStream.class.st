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
