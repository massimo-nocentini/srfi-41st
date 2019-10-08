*Collections-Streams-Srfi41
srfi41Cons: ontoBlock
	^ ValueLink new
		value: self srfi41Delay;
		nextLink: ontoBlock srfi41Stream;
		srfi41Stream