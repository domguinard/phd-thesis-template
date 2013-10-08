// This creates a temperature sensor building block.
csComponentContainer.push({
    name : "cs.web.things.[Name_of_Smart_Thing]",
    description : "[Description]",
    inputs :
    [
    {
        name: "URL", // The Smart Things' resource URL
        type: "cs.type.String"
    }, [...] // additional parameters
    ],
    outputs:
    [
    {
        name: "[Result provided by the Smart Thing]",
        type: "cs.type.[Number | String]"
    }
    ],
    image: "web/things/[Icon]",
    exec : function(state){
        this.setAsync();
        var component = this;
        $.ajax({
	    // Content negotiation, alternatively a .json could simply
	    // be added to the request URL. 
            beforeSend: function(xhrObj){
                xhrObj.setRequestHeader("Accept","application/json");
            },
	    //Read the URL provided as parameter
            url: state.inputs.item(0).getValue(),
            type: ["GET" | "PUT" | "POST" | "DELETE"],
            success: function(result){
	    // Triggered when the HTTP response arrives
	    // Process the response if required					
	    // Write it to the output of the building block	
              state.outputs.item(0).setValue(result.resource.getters[0].value);
              component.finishAsync();
            },
            error: function(msg){
                alert("Error on: "+aurl);
            }
        });
    }
});
