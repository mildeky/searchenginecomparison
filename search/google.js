var NanoTimer = require('nanotimer');
var allData = require('./../data/allData');

var search = function (value) {
	var input = browser.element('.gsfi');
	input.setValue(value);
	browser.click('.sbico');
	browser.waitForExist('#gsr');
};

var run = function(value) {
	var timer = new NanoTimer();
	var runtimeSeconds = timer.time(search, [value], 'n');
	console.log(value + ' , ' + runtimeSeconds/1000000);
	browser.pause(2000);
};

var start = function() {
	browser.url('https://google.com/');
	browser.pause(5000);
	var data = allData.get();
	for(var i=0; i<data.length; i++) {
		run(data[i]);
	}
};

module.exports = {
	start: start
};