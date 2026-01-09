return {
    Name = "AdminAnnounce", 
    Aliases = {
        "announce", 
        "adminannounce"
    }, 
    Description = "Global Server Announcement", 
    Group = "Admin", 
    Args = {
        {
            Type = "boolean", 
            Name = "Global", 
            Description = "Set Global"
        }, 
        {
            Type = "string", 
            Name = "Message", 
            Description = "Message to display to players"
        }
    }
};