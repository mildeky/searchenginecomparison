/**
 *
 * Perform a swipe left on an element.
 *
 * @param {String} selector  element to swipe on
 * @param {Number} speed     time (in seconds) to spend performing the swipe
 *
 * @uses mobile/flick
 * @type mobile
 *
 */

"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
var swipeLeft = function swipeLeft(selector) {
  var xOffset = arguments.length <= 1 || arguments[1] === undefined ? 100 : arguments[1];
  var speed = arguments.length <= 2 || arguments[2] === undefined ? 100 : arguments[2];

  /**
   * make sure xoffset is positive so we scroll right
   */
  xOffset = xOffset > 0 ? xOffset * -1 : xOffset;

  return this.pause(100).swipe(selector, xOffset, 0, speed);
};

exports["default"] = swipeLeft;
module.exports = exports["default"];
