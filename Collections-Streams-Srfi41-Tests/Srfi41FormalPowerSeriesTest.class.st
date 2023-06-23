Class {
	#name : #Srfi41FormalPowerSeriesTest,
	#superclass : #Srfi41AbstractTest,
	#category : 'Collections-Streams-Srfi41-Tests'
}

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> t [
	^ #t asFPS
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testAdd [
	self
		assert: (1 srfi41Repeat asFPSof: self t var) + (2 asFPSof: self t var)
		equals: (([ 3 ] srfi41Cons: [ 1 srfi41Repeat ]) asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testArctan [
	| tan |
	tan := (1 + (self t ** 2)) reciprocal integral revert.
	self
		assert: self t sin / self t cos - tan
		equals: (0 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testAt [
	self
		assert: (({1 . 2 . 1} asSrfi41Stream asPolynomialOf: self t var) atStrict: 1)
		equals: 4.
	self
		assert: (({1 . 2 . 1} asSrfi41Stream asPolynomialOf: self t var) atStrict: 2)
		equals: 9.
	self
		assert: (({1 . 2 . 3} asSrfi41Stream asPolynomialOf: self t var) atStrict: 2)
		equals: 17.
	self
		assert: ((1 + (2 * self t) + (self t ** 2) at: 1) next: 10)
		equals: ({1 . 3} asSrfi41Stream , 4 srfi41Repeat next: 10)
		modulo: #asOrderedCollection.
	self
		assert: (((1 - self t) reciprocal at: 1) next: 10)
		equals: (1 to: 10)
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testBinaryTrees [
	| tree |
	tree := nil.
	tree := [ 1 ] srfi41ConsFPS: [ tree ** 2 ] of: self t var.
	self
		assert: tree
		equals:
			(#( 1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900
			    2674440 ) asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testCatalanGeneratingFunction [
	| catalan |
	catalan := (1 - (1 - (4 * self t)) sqrt) / (2 * self t).
	self
		assert: catalan
		equals:
			(#(1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440 9694845 35357670 129644790 477638700 1767263190 6564120420 24466267020 91482563640 343059613650 1289904147324 4861946401452 18367353072152 69533550916004 263747951750360 1002242216651368)
				asSrfi41Stream asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testCatalanTriangle [
	| d |
	d := (1 - (1 - (4 * self t)) sqrt) / (2 * self t).
	10
		in: [ :size | 
			self
				assert:
					(d * (1 - (d * self t * self z)) reciprocal
						asArray2Drows: size
						columns: size) transposed
				equals: (size @ size) catalanTriangle ]
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testCatalanTriangleBigSizeAsString [
	| d |
	d := (1 - (1 - (4 * self t)) sqrt) / (2 * self t).
	20
		in: [ :size | 
			self
				assert:
					(d * (1 - (d * self t * self z)) reciprocal
						asArray2Drows: size
						columns: size) transposed asString
				equals:
					'(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
2 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
5 5 3 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
14 14 9 4 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
42 42 28 14 5 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0
132 132 90 48 20 6 1 0 0 0 0 0 0 0 0 0 0 0 0 0
429 429 297 165 75 27 7 1 0 0 0 0 0 0 0 0 0 0 0 0
1430 1430 1001 572 275 110 35 8 1 0 0 0 0 0 0 0 0 0 0 0
4862 4862 3432 2002 1001 429 154 44 9 1 0 0 0 0 0 0 0 0 0 0
16796 16796 11934 7072 3640 1638 637 208 54 10 1 0 0 0 0 0 0 0 0 0
58786 58786 41990 25194 13260 6188 2548 910 273 65 11 1 0 0 0 0 0 0 0 0
208012 208012 149226 90440 48450 23256 9996 3808 1260 350 77 12 1 0 0 0 0 0 0 0
742900 742900 534888 326876 177650 87210 38760 15504 5508 1700 440 90 13 1 0 0 0 0 0 0
2674440 2674440 1931540 1188640 653752 326876 149226 62016 23256 7752 2244 544 104 14 1 0 0 0 0 0
9694845 9694845 7020405 4345965 2414425 1225785 572033 245157 95931 33915 10659 2907 663 119 15 1 0 0 0 0
35357670 35357670 25662825 15967980 8947575 4601610 2187185 961400 389367 144210 48279 14364 3705 798 135 16 1 0 0 0
129644790 129644790 94287120 58929450 33266625 17298645 8351070 3749460 1562275 600875 211508 67298 19019 4655 950 152 17 1 0 0
477638700 477638700 347993910 218349120 124062000 65132550 31865925 14567280 6216210 2466750 904475 303600 92092 24794 5775 1120 170 18 1 0
1767263190 1767263190 1289624490 811985790 463991880 245642760 121580760 56448210 24582285 10015005 3798795 1332045 427570 123970 31878 7084 1309 189 19 1 )' ]
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testConvolution [
	| ones |
	ones := 1 srfi41Repeat asFPSof: self t var.
	self
		assert: ones * ones
		equals: (Srfi41NumbersSequence naturalsCorecursive cdr asFPSof: #t)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testCos [
	self
		assert: self t cos
		equals: ({ 
				 1.
				 0.
				 (-1 / 2).
				 0.
				 (1 / 24).
				 0.
				 (-1 / 720).
				 0.
				 (1 / 40320).
				 0.
				 (-1 / 3628800).
				 0.
				 (1 / 479001600).
				 0.
				 (-1 / 87178291200) } asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testDerivative [
	self
		assert: (1 - self t) reciprocal derivative
		equals: ((1 - self t) ** 2) reciprocal
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testEmptyStream [
	self
		assert: ({} asSrfi41Stream asFPSof: self t var)
		equals: (0 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testExp [
	self
		assert: self t exp
		equals:
			({1.
			1.
			(1 / 2).
			(1 / 6).
			(1 / 24).
			(1 / 120).
			(1 / 720).
			(1 / 5040).
			(1 / 40320).
			(1 / 362880).
			(1 / 3628800).
			(1 / 39916800).
			(1 / 479001600).
			(1 / 6227020800)} asSrfi41Stream asFPSof: self t var)
		upto: 14
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testIntegral [
	self
		assert: (1 + self t) reciprocal integral
		equals:
			({0.
			1.
			(-1 / 2).
			(1 / 3).
			(-1 / 4).
			(1 / 5).
			(-1 / 6).
			(1 / 7).
			(-1 / 8).
			(1 / 9).
			(-1 / 10).
			(1 / 11).
			(-1 / 12).
			(1 / 13).
			(-1 / 14).
			(1 / 15)} asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testMinus [
	self
		assert: (3 asFPSof: self t var) - (4 asFPSof: self t var)
		equals: (-1 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testMultiply [
	| nats |
	nats := Srfi41NumbersSequence naturalsCorecursive.
	self
		assert: (2 asFPSof: self t var) * (nats asFPSof: self t var)
		equals: ((nats collect: #double) asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (nats asFPSof: self t var) * (2 asFPSof: self t var)
		equals: ((nats collect: #double) asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testNegated [
	self
		assert: (1 srfi41Repeat asFPSof: self t var) negated
		equals: (-1 srfi41Repeat asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testNthRoot [
	self
		assert: (1 - (self t cos ** 2)) sqrt
		equals: self t sin
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - (self t cos ** 2) nthRoot: 3)
		equals:
			({0.
			1.
			0.
			(-1 / 9).
			0.
			(1 / 405).
			0.
			(-4 / 76545).
			0.
			(-4 / 3444525).
			0.
			(-1 / 9743085).
			0.
			(-32827 / 4189282972875).
			0.
			(-944 / 1508141870235).
			0.
			(-211817 / 4120459038320625).
			0.
			(-268365011 / 62145587307759330375).
			0.
			(-4371714419 / 11831563737438795590625).
			0.
			(-146006790364 / 4548391145349685562053125).
			0.
			(-14348522377808 / 5079725929147353375438421875).
			0.
			(-884512589502824 / 3520250068899115889178826359375).
			0.
			(-17773957391896 / 787845367846569410972109140625)} asSrfi41Stream
				asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testOrderedTrees [
	| tree forest list |
	tree := forest := list := nil.
	tree := [ 0 ] srfi41ConsFPS: [ forest ] of: self t var.
	forest := [ list value: tree ] srfi41StreamFPSof: self t var.
	list := (1 - self t) reciprocal.
	self
		assert: forest
		equals:
			(#(1 1 2 5 14 42 132 429 1430 4862 16796 58786 208012 742900 2674440)
				asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testPascal [
	10
		in: [ :size | 
			| pascalMatrix |
			pascalMatrix := (size @ size) pascalTriangle.
			self
				assert:
					((1 - ((1 + self t) * self z)) reciprocal
						asArray2Drows: size
						columns: size)
				equals: pascalMatrix.
			self
				assert:
					(((Array
						with: (1 asFPSof: self t var)
						with: ({1 . 1} asSrfi41Stream asFPSof: self t var) negated)
						asSrfi41Stream asFPSof: self t var) reciprocal
						asArray2Drows: size
						columns: size)
				equals: pascalMatrix
			"self
				assert:
					(((1 - self t) reciprocal
						value:
							({(0 asFPSof: self z).
							(1 + self z)} asSrfi41Stream asFPSof: self t))
						asArray2Drows: size
						columns: size)
				equals: pascalMatrix" ]
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testPower [
	self
		assert: (1 srfi41Repeat asFPSof: self t var) ** 2
		equals: (Srfi41NumbersSequence naturalsCorecursive cdr asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 srfi41Repeat asFPSof: #t) ** 3
		equals: (Srfi41NumbersSequence triangulars cdr asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) ** 2
		equals: ({1 . -2 . 1} asSrfi41Stream asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - (2 * (self t ** 2))) ** 3
		equals: ({1 . 0 . -6 . 0 . 12 . 0 . -8} asSrfi41Stream asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testPowerNthRoot [
	self
		assert: (1 - self t) reciprocal ** (3 / 2)
		equals:
			({1.
			(3 / 2).
			(15 / 8).
			(35 / 16).
			(315 / 128).
			(693 / 256).
			(3003 / 1024).
			(6435 / 2048).
			(109395 / 32768).
			(230945 / 65536).
			(969969 / 262144).
			(2028117 / 524288).
			(16900975 / 4194304).
			(35102025 / 8388608).
			(145422675 / 33554432)} asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testReciprocal [
	self
		assert: (1 srfi41Repeat asFPSof: self t var) reciprocal
		equals: ({1 . -1} asSrfi41Stream asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: ({1 . -1} asSrfi41Stream asFPSof: self t var) reciprocal
		equals: (1 srfi41Repeat asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) reciprocal
		equals: (1 srfi41Repeat asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert:
			({1 . -1} asSrfi41Stream asFPSof: self t var)
				* (1 srfi41Repeat asFPSof: self t var)
		equals: (1 asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - self t) reciprocal ** 2
		equals: (1 srfi41CountForward asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testRevert [
	| G |
	G := (1 + (self t ** 2)) reciprocal integral revert.
	self
		assert: G
		equals:
			({0.
			1.
			0.
			(1 / 3).
			0.
			(2 / 15).
			0.
			(17 / 315).
			0.
			(62 / 2835).
			0.
			(1382 / 155925).
			0.
			(21844 / 6081075).
			0.
			(929569 / 638512875).
			0.
			(6404582 / 10854718875).
			0.
			(443861162 / 1856156927625).
			0.
			(18888466084 / 194896477400625).
			0.
			(113927491862 / 2900518163668125).
			0.
			(58870668456604 / 3698160658676859375).
			0.
			(8374643517010684 / 1298054391195577640625).
			0.
			(689005380505609448 / 263505041412702261046875)} asSrfi41Stream
				asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testShift [
	self
		assert: (1 asFPSof: self t var) >> 3
		equals: self t ** 3
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: self t >> 3
		equals: self t ** 4
		upto: 30
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testSin [
	self
		assert: self t sin
		equals:
			({0.
			1.
			0.
			(-1 / 6).
			0.
			(1 / 120).
			0.
			(-1 / 5040).
			0.
			(1 / 362880).
			0.
			(-1 / 39916800).
			0.
			(1 / 6227020800).
			0} asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> testTan [
	self
		assert: self t tan
		equals:
			({0.
			1.
			0.
			(1 / 3).
			0.
			(2 / 15).
			0.
			(17 / 315).
			0.
			(62 / 2835).
			0.
			(1382 / 155925).
			0.
			(21844 / 6081075).
			0} asSrfi41Stream asFPSof: self t var)
		upto: 15
		modulo: #asOrderedCollection
]

{ #category : #tests }
Srfi41FormalPowerSeriesTest >> z [
	^ #z asFPS
]
