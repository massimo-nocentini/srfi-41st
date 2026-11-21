Class {
	#name : #BaselineOfSrfi41,
	#superclass : #BaselineOf,
	#category : #BaselineOfSrfi41
}

{ #category : #baselines }
BaselineOfSrfi41 >> baseline: spec [
	"Containers-Essentials brings CTArray2D (Containers-Array2D), CTSlotDescriptorsVisitor and RandomInteger (Roassal-Utils of RoassalMN)."

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'ContainersEssentials'
			with: [
			spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			package: 'Collections-Streams-Srfi41'
			with: [ spec requires: #( 'ContainersEssentials' ) ];
			package: 'Collections-Streams-Srfi41-SICP'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-ArithSequences'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-FPS'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-Tests' with: [
				spec requires:
						#( 'Collections-Streams-Srfi41' 'Collections-Streams-Srfi41-ArithSequences' 'Collections-Streams-Srfi41-FPS' 'Collections-Streams-Srfi41-Combinatorics' 'Collections-Streams-Srfi41-SICP' 'Collections-Streams-Srfi41-Extensions' ) ];
			package: 'Collections-Streams-Srfi41-Extensions'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ];
			package: 'Collections-Streams-Srfi41-Combinatorics'
			with: [ spec requires: #( 'Collections-Streams-Srfi41' ) ] ]
]
