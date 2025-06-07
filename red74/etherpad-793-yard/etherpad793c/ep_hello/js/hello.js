exports.postAceInit = (hookName, context) => {
  console.log("ep_hello loaded");
};

exports.aceInitialized = (hookName, context) => {
  // You could hook into ace directly here if needed.
};

exports.postToolbarInit = (hookName, context) => {
  context.toolbar.registerButton('hellobutton', {
    command: 'sayHello',
    class: 'buttonicon buttonicon-chat',
    title: 'Say Hello'
  });

  context.ace.callWithAce((ace) => {
    ace.ace_registerCommand('sayHello', () => {
      console.log("Hello, Etherpad!");
      alert("Hello from Etherpad Plugin!");
    });
  }, 'sayHello', true);
};
