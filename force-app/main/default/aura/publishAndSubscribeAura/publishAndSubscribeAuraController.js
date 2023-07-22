({
    handleClick: function (component, event) {
        var name = component.get("v.FullName");
        var payload = { Message:  name};

        // Publish LMS message with payload
        component.find('channelForAuraLWC').publish(payload);
    },
    
	handleMessage: function (component, helper, message) {
        var name;
        var service;
		console.log(message);
        console.log(message.getParam('Message'));
        if (message && message.getParam('Message')) {
            // Retrieve LMS message parameter
            name = message.getParam('Message');
            component.set('v.Name', name);

            // Refresh record from data service
            service = component.find('service');
            service.reloadRecord();
        } else {
            component.set('v.Name', '');
        }
    },
    
    handleEdit : function(component, event, helper) 
    {  var edit = component.get("v.EditString");
    	console.log(edit);
      var payload = { Message:  "Edit"};
     component.find('channelForAuraLWC').publish(payload);
    //  component.find('publishAndSubscribe').editFunction (edit);  
        
    }
})