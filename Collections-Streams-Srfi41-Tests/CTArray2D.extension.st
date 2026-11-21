Extension { #name : #CTArray2D }

{ #category : #'*Collections-Streams-Srfi41-Tests' }
CTArray2D >> srfi41MatrixString [
	"The rows separated by new lines, as Array2D used to print itself."

	^ String streamContents: [ :aStream |
		  aStream nextPut: $(.
		  (1 to: self height)
			  do: [ :y |
				  (1 to: self width)
					  do: [ :x | aStream print: (self atColumn: x atRow: y) ]
					  separatedBy: [ aStream space ] ]
			  separatedBy: [ aStream cr ].
		  aStream nextPutAll: ' )' ]
]

{ #category : #'*Collections-Streams-Srfi41-Tests' }
CTArray2D >> srfi41Transposed [

	^ CTArray2D
		  width: self height
		  height: self width
		  tabulate: [ :x :y | self atColumn: y atRow: x ]
]
