Extension { #name : #ValueLink }

{ #category : #'*Collections-Streams-Srfi41' }
ValueLink class >> carBlock: aBlock cdrBlock: dBlock [
	^ self carBlock: aBlock cdrStream: dBlock srfi41Stream
]

{ #category : #'*Collections-Streams-Srfi41' }
ValueLink class >> carBlock: aBlock cdrStream: aStream [
	^ self new
		value: aBlock srfi41Delay;
		nextLink: aStream;
		srfi41Stream
]

{ #category : #'*Collections-Streams-Srfi41' }
ValueLink >> carParentSrfi41Stream: aStream [
	^ self value
]

{ #category : #'*Collections-Streams-Srfi41' }
ValueLink >> cdrParentSrfi41Stream: aStream [
	^ self nextLink
]

{ #category : #'*Collections-Streams-Srfi41' }
ValueLink >> isEmptySrfi41Stream: aStream [
	^ false
]
