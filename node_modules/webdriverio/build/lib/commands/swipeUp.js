/**
 *
 * Perform a swipe up on an element.
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
var swipeUp = function swipeUp(selector) {
  var yOffset = arguments.length <= 1 || arguments[1] === undefined ? -100 : arguments[1];
  var speed = arguments.length <= 2 || arguments[2] === undefined ? 100 : arguments[2];

  /**
   * make sure yoffset is negative so we scroll down
   */
  yOffset = yOffset > 0 ? yOffset * -1 : yOffset;

  return this.pause(100).swipe(selector, 0, yOffset, speed);
};

exports["default"] = swipeUp;
module.exports = exports["default"];
