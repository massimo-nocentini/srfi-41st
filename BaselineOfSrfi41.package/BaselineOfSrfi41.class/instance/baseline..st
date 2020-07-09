baselines
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'dsst'
			with: [ spec repository: 'github://massimo-nocentini/dsst' ].
		spec
			package: 'Collections-Streams-Srfi41'
			with: [ 
				spec requires: #( 'Collections-Streams-Srfi41-Extensions' ) ];
			package: 'Collections-Streams-Srfi41-ArithSequences'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-FPS' with: [ 
				spec requires:
						#( 'Collections-Streams-Srfi41' 'Collections-Streams-Srfi41-Combinatorics' ) ];
			package: 'Collections-Streams-Srfi41-Tests' with: [ 
				spec requires:
						#( 'Collections-Streams-Srfi41' 'Collections-Streams-Srfi41-ArithSequences' ) ] ]