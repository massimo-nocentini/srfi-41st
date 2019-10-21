evaluating
definition
	^ [ :graycode | 
	graycode
		collect: [ :codesStream | 
			(codesStream collect: [ :code | Array with: 0 withAll: code ])
				,
					(codesStream reverse collect: [ :code | Array with: 1 withAll: code ]) ] ]
		srfi41CoRecursionWithInitials: {Array new srfi41Singleton}