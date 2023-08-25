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
