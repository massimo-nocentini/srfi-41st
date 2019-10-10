running
setUp
	"Hooks that subclasses may override to define the fixture of test."

	corecursiveNats := Srfi41NumbersSequence naturalsCorecursive.
	iterativeNats := Srfi41NumbersSequence naturalsIterative 