running
setUp
	"Hooks that subclasses may override to define the fixture of test."

	corecursiveNats := 0
		srfi41NaturalsDefined: Srfi41DefinitionCorecursive new.
	iterativeNats := 0
		srfi41NaturalsDefined: Srfi41DefinitionIterative new