

// index.js
exports.eejsBlock_toolbarLeft = function (hook_name, args, cb) {
  args.content += '<button onclick="alert(\'Hello\')">Say Hello</button>';
  return cb();
};

