var google = require('./google');
var bing = require('./bing');
var yahoo = require('./yahoo');
var aol = require('./aol');

describe('test', function () {
	this.timeout(0);

	it('google runs', function () {
		console.log('google');
		google.start();
	});

	// it('bing runs', function () {
	// 	console.log('bing');
	// 	bing.start();
	// });

	// it('yahoo runs', function () {
	// 	console.log('yahoo');
	// 	yahoo.start();
	// });

	// it('aol runs', function () {
	// 	console.log('aol');
	// 	aol.start();
	// });
});