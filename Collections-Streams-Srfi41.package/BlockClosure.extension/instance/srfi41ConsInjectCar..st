*Collections-Streams-Srfi41
srfi41ConsInjectCar: ontoBlock
	"This is mandatory in order to evaluate myself exactly one time, 
	to protect against side-effect code in myself such as random computation"

	^ [ | car |
	car := self value.
	[ car ] srfi41Cons: [ ontoBlock value: car ] ] srfi41Stream