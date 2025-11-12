"use strict";

/**
 * Sleep for a specified number of milliseconds
 * @param {number} ms - Number of milliseconds to sleep
 * @returns {Promise} Promise that resolves after the specified time
 */
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

module.exports = {
    sleep,
};
