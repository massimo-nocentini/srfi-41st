as yet unclassified
integral
	^ [ 0 ]
		srfi41ConsFPS:
			[ self elementwiseFPS: (1 srfi41CountForward asFPSof: self var) do: #/ ]
		of: self var