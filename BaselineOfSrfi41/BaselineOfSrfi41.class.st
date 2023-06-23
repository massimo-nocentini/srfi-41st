Class {
	#name : #BaselineOfSrfi41,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSrfi41'
}

{ #category : #baselines }
BaselineOfSrfi41 >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Collections-Streams-Srfi41';
			package: 'Collections-Streams-Srfi41-ArithSequences'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-FPS'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-Tests' with: [ 
				spec requires:
						#( 'Collections-Streams-Srfi41' 'Collections-Streams-Srfi41-ArithSequences' ) ];
			package: 'Collections-Streams-Srfi41-Extensions';
			package: 'Collections-Streams-Srfi41-Combinatorics' ]
]
