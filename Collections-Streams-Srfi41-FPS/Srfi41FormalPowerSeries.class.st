"
!Formal power series

In mathematics, a formal power series is a generalization of a polynomial, where the number of terms is allowed to be infinite; this implies giving up the possibility of replacing the variable in the polynomial with an arbitrary number. Thus a formal power series differs from a polynomial in that it may have infinitely many terms, and differs from a power series, whose variables can take on numerical values. One way to view a formal power series is as an infinite ordered sequence of numbers. In this case, the powers of the variable are used only to indicate the order of the coefficients, so that the coefficient of x^{5} is the fifth term in the sequence. In combinatorics, formal power series provide representations of numerical sequences and of multisets, and for instance allow concise expressions for recursively defined sequences regardless of whether the recursion can be explicitly solved; this is known as the method of generating functions. More generally, formal power series can include series with any finite number of variables, and with coefficients in an arbitrary ring. Formal power series can be created from Taylor polynomials using formal moduli.

From *https://en.wikipedia.org/wiki/Formal_power_series*.
"
Class {
	#name : #Srfi41FormalPowerSeries,
	#superclass : #Object,
	#instVars : [
		'stream',
		'var'
	],
	#category : 'Collections-Streams-Srfi41-FPS'
}

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> * aSrfi41FormalPowerSeries [
	^ aSrfi41FormalPowerSeries
		ifFPS: [ self var = aSrfi41FormalPowerSeries var
				ifTrue: [ (self stream
						convolution: aSrfi41FormalPowerSeries stream
						f: #*
						combiner: [ :a :b | a zip: b with: #+ ]) asFPSof: self var ]
				ifFalse: [ (aSrfi41FormalPowerSeries stream collect: [ :each | self * each ])
						asFPSof: aSrfi41FormalPowerSeries var ] ]
		ifNotFPS: [ aSrfi41FormalPowerSeries
				adaptToFPS: self
				andSend: thisContext selector ]
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> ** n [
	^ [ n isZero
		ifTrue: [ 1 asFPSof: self var ]
		ifFalse: [ n isInteger
				ifTrue: [ self ** (n - 1) * self ]
				ifFalse: [ self ** n numerator nthRoot: n denominator ] ] ]
		srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> + aSrfi41FormalPowerSeries [
	^ self elementwiseFPS: aSrfi41FormalPowerSeries do: #+
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> - aSrfi41FormalPowerSeries [
	^ self elementwiseFPS: aSrfi41FormalPowerSeries do: #-
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> / aSrfi41FormalPowerSeries [
	^ [ (self car isZero and: [ aSrfi41FormalPowerSeries car isZero ])
		ifTrue: [ self cdr / aSrfi41FormalPowerSeries cdr ]
		ifFalse: [ self * aSrfi41FormalPowerSeries reciprocal ] ]
		srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> >> n [
	^ [ self var asFPS ** n * self ] srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> adaptToNumber: anInteger andSend: aString [
	^ (anInteger asFPSof: self var) perform: aString with: self
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> asArray2Drows: rows columns: cols [
	^ Array2D
		rows: rows
		columns: cols
		tabulate: [ :n :k | (self stream at: n) stream at: k ]
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> at: aNumber [
	^ self stream scan1: [ :acc :each | aNumber * each + acc ]
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> atStrict: aNumber [
	^ self stream
		foldrStrict: [ :each :acc | aNumber * acc + each ]
		init: [ 0 ]
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> car [
	^ self stream car
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> cdr [
	^ self stream cdr asFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> cos [
	^ [ 1 + self sin integral negated ] srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> derivative [
	^ [ self cdr
		elementwiseFPS: (1 srfi41CountForward asFPSof: self var)
		do: #* ] srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> elementwiseFPS: aSrfi41FormalPowerSeries do: aBlock [
	^ (self stream zip: aSrfi41FormalPowerSeries stream with: aBlock)
		asFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> exp [
	"^ [ 1 asFPS + self exp integral ] srfi41StreamFPS"

	| Y |
	Y := nil.
	Y := [ 1 + Y integral ] srfi41StreamFPSof: self var.
	^ Y
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> ifFPS: aBlockClosure ifNotFPS: elseBlockClosure [
	^ aBlockClosure cull: self
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> integral [
	^ [ 0 ]
		srfi41ConsFPS:
			[ self elementwiseFPS: (1 srfi41CountForward asFPSof: self var) do: #/ ]
		of: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> negated [
	^ (self stream collect: #negated) asFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> nthRoot: n [
	^ [ self car = 1
		ifTrue: [ | R |
			R := nil.
			R := [ 1 + (self derivative / (n * (R ** (n - 1)))) integral ]
				srfi41StreamFPSof: self var ]
		ifFalse: [ (self car isZero and: [ self cdr car isZero ])
				ifTrue: [ [ 0 ] srfi41ConsFPS: [ self cdr cdr nthRoot: n ] of: self var ]
				ifFalse: [ Error signal ] ] ] srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> reciprocal [
	^ [ | R carReciprocal |
	carReciprocal := self car reciprocal.
	R := nil.
	R := [ carReciprocal ]
		srfi41ConsFPS: [ carReciprocal negated * R * self cdr ]
		of: self var ] srfi41StreamFPSof: self var
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> revert [
	"Theoretically we should ensure that `self assert: self car equals: 0"

	| Y |
	Y := nil.
	Y := [ self car ]
		srfi41ConsFPS: [ (self cdr value: Y) reciprocal ]
		of: self var.
	^ Y
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> sin [
	^ [ self cos integral ] srfi41StreamFPSof: self var
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> sqrt [
	^ self nthRoot: 2
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> stream [
	^ stream
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> stream: anObject [
	stream := anObject
]

{ #category : #'as yet unclassified' }
Srfi41FormalPowerSeries >> tan [
	^ [ self sin / self cos ] srfi41StreamFPSof: self var
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> value: aSrfi41FormalPowerSeries [
	^ [ aSrfi41FormalPowerSeries car isZero
		ifTrue: [ [ self car ]
				srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr
						* (self cdr value: aSrfi41FormalPowerSeries) ]
				of: aSrfi41FormalPowerSeries var ]
		ifFalse: [ | composition |
			composition := self cdr value: aSrfi41FormalPowerSeries.
			self car + (aSrfi41FormalPowerSeries car * composition)
				+
					([ 0 ]
						srfi41ConsFPS: [ aSrfi41FormalPowerSeries cdr * composition ]
						of: self var) ] ] srfi41StreamFPSof: self var
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> var [
	^ var
]

{ #category : #accessing }
Srfi41FormalPowerSeries >> var: anObject [
	var := anObject
]
