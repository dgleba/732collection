const path = require('path');

exports.expressCreateServer = function (hook_name, args, cb) {
  args.app.get('/p/:pad/ace', function (req, res) {
    const padId = req.params.pad;
    res.sendFile(path.join(__dirname, 'acepad.html'));
  });
  return cb();
};
