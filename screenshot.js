var system = require('system');
var args = system.args;
var config = {
  address: args[1],
  dest: args[2],
  viewport_width: typeof args[3] !== 'undefined' ? args[3] : 1024,
  viewport_height: typeof args[4] !== 'undefined' ? args[4] : 768,
}
var page = require('webpage').create();
console.log(JSON.stringify(config));

page.viewportSize = {
  width: config.viewport_width,
  height: config.viewport_height
};

page.open(config.address, function() {
  page.render(config.dest);
  phantom.exit();
});
