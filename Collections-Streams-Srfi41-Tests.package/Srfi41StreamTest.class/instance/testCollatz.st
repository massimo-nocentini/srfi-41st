tests
testCollatz
	self
		assert: ((self collatzSequenceOf: 100) next: 30) asOrderedCollection
		equals: #(100
50
25
76
38
19
58
29
88
44
22
11
34
17
52
26
13
40
20
10
5
16
8
4
2
1
4
2
1
4) asOrderedCollection