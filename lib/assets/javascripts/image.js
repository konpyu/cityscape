var filename = phantom.args[0];
console.log(typeof filename);
var page = require('webpage').create();
page.open(filename, function () {
    page.render(filename + ".png");
    phantom.exit();
});
