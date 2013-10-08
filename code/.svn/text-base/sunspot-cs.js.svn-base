//This is the Sun Spot temperature component
csComponentContainer.push({
    name : "cs.web.things.temperature",
    description : "Get the temperature from a RESTful Sun SPOT",
    inputs :
    [
    {
        name: "IP",
        type: "cs.type.String"
    },
    {
        name: "Name",
        type: "cs.type.String"
    }
    ],
    outputs:
    [
    {
        name: "Temperature",
        type: "cs.type.Number"
    }
    ],
    image: "web/things/temperature.png",
    exec : function(state){
        this.setAsync();
        var ip = state.inputs.item(0).getValue();
        var name = state.inputs.item(1).getValue();
        var aurl = "http://" + ip + "/sunspots/" + name + "/sensors/temperature";
        var component = this;
        $.ajax({
            beforeSend: function(xhrObj){
                xhrObj.setRequestHeader("Accept","application/json");
            },
            url: aurl,
            type: "GET",
            dataType: "json",
            success: function(result){
                var temp = result.resource.getters[0].value
                // write this to output socket, expecting a number
                state.outputs.item(0).setValue(temp)
                component.finishAsync();
            },
            error: function(msg){
                alert("Error on: "+aurl);
            }
        });
    }
});
