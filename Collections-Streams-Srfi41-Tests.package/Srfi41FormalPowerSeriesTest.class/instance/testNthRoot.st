tests
testNthRoot
	self
		assert: (1 - (self t cos ** 2)) sqrt
		equals: self t sin
		upto: 30
		modulo: #asOrderedCollection.
	self
		assert: (1 - (self t cos ** 2) nthRoot: 3)
		equals:
			({0.
			1.
			0.
			(-1 / 9).
			0.
			(1 / 405).
			0.
			(-4 / 76545).
			0.
			(-4 / 3444525).
			0.
			(-1 / 9743085).
			0.
			(-32827 / 4189282972875).
			0.
			(-944 / 1508141870235).
			0.
			(-211817 / 4120459038320625).
			0.
			(-268365011 / 62145587307759330375).
			0.
			(-4371714419 / 11831563737438795590625).
			0.
			(-146006790364 / 4548391145349685562053125).
			0.
			(-14348522377808 / 5079725929147353375438421875).
			0.
			(-884512589502824 / 3520250068899115889178826359375).
			0.
			(-17773957391896 / 787845367846569410972109140625)} asSrfi41Stream
				asFPSof: self t var)
		upto: 30
		modulo: #asOrderedCollection