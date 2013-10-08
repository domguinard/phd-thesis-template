var myWebSocket = new WebSocket("ws://www.webofthings.com");

myWebSocket.onopen = function(evt) { 
alert("Connection open ..."); };
myWebSocket.onmessage = function(evt) { 
alert( "Received Message: "  +  evt.data); };
myWebSocket.onclose = function(evt) { 
alert("Connection closed."); };

myWebSocket.send("Hello Web Sockets!");
myWebSocket.close();
