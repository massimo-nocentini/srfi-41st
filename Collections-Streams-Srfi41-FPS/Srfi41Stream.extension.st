Extension { #name : #Srfi41Stream }

{ #category : #'*Collections-Streams-Srfi41-FPS' }
Srfi41Stream >> asFPSof: t [
	^ Srfi41FormalPowerSeries new
		var: t;
		stream: self , 0 srfi41Repeat;
		yourself
]

{ #category : #'*Collections-Streams-Srfi41-FPS' }
Srfi41Stream >> asPolynomialOf: t [
	^ Srfi41FormalPowerSeries new
		var: t;
		stream: (self ifEmpty: [ 0 srfi41Singleton ] ifNotEmpty: #yourself);
		yourself
]
