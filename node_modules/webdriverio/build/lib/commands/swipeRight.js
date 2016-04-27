/**
 *
 * Perform a swipe right on an element.
 *
 * @param {String} selector  element to swipe on
 * @param {Number} speed     time (in seconds) to spend performing the swipe
 *
 * @uses mobile/swipe
 * @type mobile
 *
 */

"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
var swipeRight = function swipeRight(selector) {
  var xOffset = arguments.length <= 1 || arguments[1] === undefined ? -100 : arguments[1];
  var speed = arguments.length <= 2 || arguments[2] === undefined ? 100 : arguments[2];

  /**
   * make sure xoffset is negative so we scroll left
   */
  xOffset = xOffset < 0 ? xOffset * -1 : xOffset;

  return this.pause(100).swipe(selector, xOffset, 0, speed);
};

exports["default"] = swipeRight;
module.exports = exports["default"];
