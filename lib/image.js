var filename = phantom.args[0];
console.log(typeof filename);
var page = require('webpage').create();
page.open(filename, function () {
    var m = filename.match(/sv_(.*)\.html/);
    page.render("image/" + RegExp.$1 + ".png");
    phantom.exit();
});
